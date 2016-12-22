#include <windows.h>
#include <windowsx.h>
#include <iostream>
#include <cstdio>
#include <string>

using namespace std;

#define Filename "C:\\Program Files\\mIRC\\mirc.exe"
#define DLLTOINJECT "D:\\VCPrj\\DLLInjector\\Injector\\DLL\\Debug\\DLL.dll"

//@@@@@@@@@@@
CONTEXT OriginalContext;
char OriginalCodePage[4096];
DWORD sizeofCP=0;
VOID* mySec;

//return values:
//
//	if 0	->	successful
//	if -1	->	(0xFFFFFFFF) WriteProcessMemory returned FALSE
//	else	->	Amount of bytes written + 1 
//				(to get exact amount of bytes written, you must decrement return value by one!)
//

DWORD RestoreOriginalCodePage( HANDLE hProcess, HANDLE hThread, DWORD *outSize )
{
	BOOL B;
	DWORD written;
	CONTEXT Context;

	if(outSize) *outSize = sizeofCP; //Just for user's info

	Context.ContextFlags = CONTEXT_FULL;
	GetThreadContext( hThread, &Context);

	B = WriteProcessMemory( hProcess, mySec, OriginalCodePage, sizeofCP, &written );

	if(!B)
		return -1;

	if(written!=sizeofCP)
		return written+1;

	B=SetThreadContext( hThread, (CONST CONTEXT*)&OriginalContext);
	if(!B)
		return -1;

	return 0;
}


BOOL InjectDLL(HANDLE hProcess, HANDLE hThread, VOID* hModuleBase, char *DllName)
{//You must have debug access to hProcess (required for ReadProcessMemory() & WriteProcessMemory)

	FARPROC LoadLibProc = GetProcAddress(GetModuleHandle("KERNEL32.dll"), "LoadLibraryA");
	FARPROC LastErrProc = GetProcAddress(GetModuleHandle("KERNEL32.dll"), "GetLastError");
	if(!LoadLibProc || !LastErrProc) return FALSE;


	

	////////////////////////////////
	
	char CodePage[4096] = 
	
	{	0xB8, 00, 00, 00, 00,	// mov EAX,  0h | Pointer to LoadLibraryA() (DWORD)
		0xBB, 00, 00, 00, 00,	// mov EBX,  0h | DLLName to inject (DWORD)
		0x53,					// push EBX
		0xFF, 0xD0,				// call EAX
		0x5b,					// pop EBX
		0xcc					// INT 3h
	};
	int nob=15;
	
		char *DLLName;
		DWORD *EAX, *EBX;

		DLLName = (char*)((DWORD)CodePage + nob);
		EAX = (DWORD*)( CodePage +  1);
		EBX = (DWORD*) ( CodePage +  6);

		strcpy( DLLName, DllName );
		*EAX = (DWORD)LoadLibProc;
		*EBX = nob; // need to do this: *EBX = *EBX + (Section)
	////////////////////////////
		sizeofCP = strlen(DllName) + nob +1;

	IMAGE_DOS_HEADER		DOShdr;
	IMAGE_NT_HEADERS		*pNThdr, NThdr;
	IMAGE_SECTION_HEADER	SecHdr, *pSecHdr;
	IMAGE_DATA_DIRECTORY	DataDir, *pDataDir; //@@@@@@@@
	DWORD dwD, dwD2, read, written;
	CONTEXT Context;
	BOOL B;

	Context.ContextFlags = CONTEXT_FULL;//CONTROL;
	OriginalContext.ContextFlags = CONTEXT_FULL;//CONTROL;
	if(!GetThreadContext( hThread, &OriginalContext))
	{
		dwD = GetLastError();
		return FALSE;
	}
		
	// Check to see if we have valid Headers:
	//
	/////////Get DOS hdr
	B = ReadProcessMemory(hProcess, hModuleBase, &DOShdr, sizeof(DOShdr), &read);
	if( (!B) || (read!=sizeof(DOShdr)) ) return FALSE;
	if( DOShdr.e_magic != IMAGE_DOS_SIGNATURE ) //Check for `MZ
		return FALSE;
	
	//Get NT header
	B = ReadProcessMemory( hProcess, 
		(VOID*)((DWORD)hModuleBase + (DWORD)DOShdr.e_lfanew), &NThdr, sizeof(NThdr), &read);
	if( (!B) || (read!=sizeof(NThdr)) ) return FALSE;
	if( NThdr.Signature != IMAGE_NT_SIGNATURE ) //Check for `PE\0\0
		return 0;

	// Valid EXE header!
	// Look for a usable writable code page:
	//

	/////
		//
		if( (dwD=NThdr.FileHeader.NumberOfSections) < 1 ) 
			return FALSE;//Section table: (after optional header)
		
		pSecHdr = (IMAGE_SECTION_HEADER*)
			( 
			((DWORD)hModuleBase + (DWORD)DOShdr.e_lfanew) + 
			 (DWORD)sizeof(NThdr.FileHeader) + 
			 (DWORD)NThdr.FileHeader.SizeOfOptionalHeader + 4
			 );//@@@@@@@@@@@@@

		B=FALSE;
		dwD2 = (DWORD)GetModuleHandle(0);
		
		for( dwD2=0 ; dwD2<dwD ; dwD2++ )
		{//iterate sections to look for a writable part of memory and NOT .idata
			if( !ReadProcessMemory( hProcess, pSecHdr, &SecHdr, sizeof(SecHdr), &read) )
				return FALSE;
			if(read!=sizeof(SecHdr)) return FALSE;
			
			if( 
				(SecHdr.Characteristics & IMAGE_SCN_MEM_WRITE) //writable section
				&&
				( strcmpi((const char*)SecHdr.Name, ".idata")!=NULL ) //not .idata (import data)
				)
			{
				B = TRUE;
				break;//OK!!
			}
			pSecHdr++;
		}

		if(!B)
			return FALSE; //couldn't find usable code page!
		//
	/////
		//Found a section:  (SecHdr.VirtualAddress + (DWORD)hModuleBase)
		mySec = (VOID*)(SecHdr.VirtualAddress + (DWORD)hModuleBase);

		*EBX = *EBX + (DWORD)mySec;
		
		if(!ReadProcessMemory( hProcess, mySec,
			OriginalCodePage, sizeofCP, &read) )
			return FALSE;
		if(read != sizeofCP)
			return FALSE;
		
		//Now starts the mega part! (If an error occurs here, god knows what might happen!
		B = WriteProcessMemory( hProcess, mySec,
			CodePage, sizeofCP, &written);
		
		if( (written!=0) && (written!=sizeofCP) )  //Uh oh!, System crash might occur now!
		{//****EMERGENCY**** ****EMERGENCY**** ****EMERGENCY**** ****EMERGENCY****
			WriteProcessMemory( hProcess, mySec, OriginalCodePage, sizeofCP, &written);
			// Try to save what you can, and return back to memory
						
			return FALSE; //might not have worked, so, big s***!
		}

		if((!B) || (written!=sizeofCP))
			return FALSE;
		
		//Ok, injected successfully, 
		//You MUST call function RestoreOriginalCodePage() function upon the following breakpoint!
		Context = OriginalContext;
		Context.Eip = (DWORD)mySec;
		B = SetThreadContext(hThread, &Context);
		if(!B) return FALSE;


	return 1;
}


int Create()
{
	BOOL B=FALSE, BREAK1=FALSE, BREAK2=FALSE;
	STARTUPINFO			sInfo;
	PROCESS_INFORMATION pInfo;
	DEBUG_EVENT			dEvent;
	DWORD				ret;
	
	ZeroMemory((VOID*)&sInfo, sizeof(sInfo));
	B = CreateProcess(Filename, 0, 0, 0, FALSE, DEBUG_ONLY_THIS_PROCESS,
		0, 0, &sInfo, &pInfo);
	if(!B) return FALSE;
	
	//-----
	///
	////  
	///// We need 3 things, ProcessHandle, ThreadHandle, and BaseOfImage
	////  
	///
	//-----


	HANDLE				PHandle=pInfo.hProcess, THandle=pInfo.hThread;
	VOID *				BaseOfImage;
	//char				DLLTOINJECT[] = "d:\\VCPrj\\Inject\\DLL\\Release\\DLL.dll";
	//^^#defined above..

	while(1)
	{
		if( !(B = WaitForDebugEvent(&dEvent, INFINITE)) )
			return -1;
		
		if(dEvent.dwDebugEventCode==CREATE_PROCESS_DEBUG_EVENT)
		{
			BaseOfImage = dEvent.u.CreateProcessInfo.lpBaseOfImage;
		}

		if(dEvent.dwDebugEventCode==EXIT_PROCESS_DEBUG_EVENT)
			break;

		if(dEvent.dwDebugEventCode==EXCEPTION_DEBUG_EVENT)//Check for breakpoint
		{
			if(dEvent.u.Exception.ExceptionRecord.ExceptionCode==EXCEPTION_BREAKPOINT)
			{//It is a break point;
				if(BREAK1==FALSE)
				{//First Breakpoint occured
					B = InjectDLL( pInfo.hProcess, pInfo.hThread, BaseOfImage, 
						DLLTOINJECT);

					BREAK1 = TRUE;
					if(!B)
						return 0;
				}else if(BREAK2==FALSE)
				{
					ret = RestoreOriginalCodePage( PHandle, THandle, 0);
					BREAK2=TRUE;
				}
			}else
			{
				ContinueDebugEvent( dEvent.dwProcessId, dEvent.dwThreadId, DBG_EXCEPTION_NOT_HANDLED);
				continue;
			}

		}//end if

		ContinueDebugEvent( dEvent.dwProcessId, dEvent.dwThreadId, DBG_CONTINUE);
	}//end while()
}//end function Create()


int Open()
{






	return 0;
}






int APIENTRY WinMain(HINSTANCE hInstance, HINSTANCE prev, LPSTR lpCmdLine, int nShowCmd)
{
	Create();
	Open();
	return 0;
}
