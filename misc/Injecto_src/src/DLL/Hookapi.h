#ifndef __HOOKAPI_H
#define __HOOKAPI_H

//==================================
// SIMONSEZ - Matt Pietrek 1995 
// Modified by - CrankHank 
//               Nasser Rowhani
// FILE: HOOKAPI.C/H
//==================================
#include <windows.h>
#include <string.h>

// Macro for adding pointers/DWORDs together without C arithmetic interfering
#define MakePtr( cast, ptr, addValue ) (cast)( (DWORD)(ptr)+(DWORD)(addValue))

DWORD GetModuleBaseFromWin32sHMod(HMODULE hMod); // Prototype (defined below)

PROC WINAPI HookImportedFunction(
        HMODULE hFromModule,        // Module to intercept calls from
        PSTR    pszFunctionModule,  // Module to intercept calls to
        PSTR    pszFunctionName,    // Function to intercept calls to
        PROC    pfnNewProc          // New function (replaces old function)
        )
{
    PROC pfnOriginalProc;
    PIMAGE_DOS_HEADER pDosHeader;
    PIMAGE_NT_HEADERS pNTHeader;
    PIMAGE_IMPORT_DESCRIPTOR pImportDesc;
    PIMAGE_THUNK_DATA pThunk;
	BOOL B;
	DWORD dwOld, dw;
//	DWORD *pdw1;

    if ( IsBadCodePtr(pfnNewProc) ) // Verify that a valid pfn was passed
        return 0;
    
    // First, verify the the module and function names passed to use are valid
    pfnOriginalProc = GetProcAddress( GetModuleHandle(pszFunctionModule),
                                      pszFunctionName );

/*	pdw1 = (DWORD*)pfnOriginalProc;
	pfnOriginalProc = (PROC)*pdw1;*/

    if ( !pfnOriginalProc )
        return 0;
    
    if ( (GetVersion() & 0xC0000000) == 0x80000000 )
        pDosHeader =                                            // Win32s
            (PIMAGE_DOS_HEADER)GetModuleBaseFromWin32sHMod(hFromModule);
    else
        pDosHeader = (PIMAGE_DOS_HEADER)hFromModule;            // other

    // Tests to make sure we're looking at a module image (the 'MZ' header)
    if ( IsBadReadPtr(pDosHeader, sizeof(IMAGE_DOS_HEADER)) )
        return 0;
    if ( pDosHeader->e_magic != IMAGE_DOS_SIGNATURE )
        return 0;

    // The MZ header has a pointer to the PE header
    pNTHeader = MakePtr(PIMAGE_NT_HEADERS, pDosHeader, pDosHeader->e_lfanew);

    // More tests to make sure we're looking at a "PE" image
    if ( IsBadReadPtr(pNTHeader, sizeof(IMAGE_NT_HEADERS)) )
        return 0;
    if ( pNTHeader->Signature != IMAGE_NT_SIGNATURE )
        return 0;

    // We know have a valid pointer to the module's PE header.  Now go
    // get a pointer to its imports section
    pImportDesc = MakePtr(PIMAGE_IMPORT_DESCRIPTOR, pDosHeader, 
                            pNTHeader->OptionalHeader.
                            DataDirectory[IMAGE_DIRECTORY_ENTRY_IMPORT].
                            VirtualAddress);
                        
    // Bail out if the RVA of the imports section is 0 (it doesn't exist)
    if ( pImportDesc == (PIMAGE_IMPORT_DESCRIPTOR)pNTHeader )
        return 0;

    // Iterate through the array of imported module descriptors, looking
    // for the module whose name matches the pszFunctionModule parameter
    while ( pImportDesc->Name )
    {
        PSTR pszModName = MakePtr(PSTR, pDosHeader, pImportDesc->Name);
        
        if ( stricmp(pszModName, pszFunctionModule) == 0 )
            break;

        pImportDesc++;  // Advance to next imported module descriptor
    }
    
    // Bail out if we didn't find the import module descriptor for the
    // specified module.  pImportDesc->Name will be non-zero if we found it.
    if ( pImportDesc->Name == 0 )
        return 0;

    // Get a pointer to the found module's import address table (IAT)
    pThunk = MakePtr(PIMAGE_THUNK_DATA, pDosHeader, pImportDesc->FirstThunk);

    // Blast through the table of import addresses, looking for the one
    // that matches the address we got back from GetProcAddress above.
    
	while ( pThunk->u1.Function )
    {
		if ( (DWORD)pThunk->u1.Function == (DWORD)pfnOriginalProc )
        {
            // We found it!  Overwrite the original address with the
            // address of the interception function.  Return the original
            // address to the caller so that they can chain on to it.
            
			//Problem persists in winXP... Not required in win98..
			//DLL will simply unload if an unalowed byte was modified.
			if(IsBadWritePtr(&pThunk->u1.Function, 4))
			{
				B = VirtualProtect(&pThunk->u1.Function, 4, 
					PAGE_EXECUTE_READWRITE, &dwOld);
				pThunk->u1.Function = (DWORD)pfnNewProc;

				B = VirtualProtect(&pThunk->u1.Function, 4, 
					dwOld, &dw);
			}else
				pThunk->u1.Function = (DWORD)pfnNewProc;            			

			//pfnOriginalProc = (PROC)(DWORD)pdw1;
            return pfnOriginalProc;
        }
        
        pThunk++;   // Advance to next imported function address
    }
    
    return 0;   // Function not found
}

typedef DWORD (__stdcall *XPROC)(DWORD);

// Converts an HMODULE under Win32s to a base address in memory
DWORD GetModuleBaseFromWin32sHMod(HMODULE hMod)
{
    XPROC ImteFromHModule, BaseAddrFromImte;
    HMODULE hModule;
    DWORD imte;
    
    hModule = GetModuleHandle("W32SKRNL.DLL");
    if( !hModule )
        return 0;
    
    ImteFromHModule = (XPROC)GetProcAddress(hModule, "_ImteFromHModule@4");
    if ( !ImteFromHModule )
        return 0;
    
    BaseAddrFromImte = (XPROC)GetProcAddress(hModule, "_BaseAddrFromImte@4");
    if ( !BaseAddrFromImte )
        return 0;

    imte = ImteFromHModule( (DWORD)hMod);
    if ( !imte )
        return 0;
    
    return BaseAddrFromImte(imte);
}
/* example:

  typedef int (WINAPI *MESSAGEBOXPROC)(HWND, LPCTSTR, LPCTSTR, UINT);
MESSAGEBOXPROC OriginalProc;

using namespace std;

int WINAPI MsgBox(HWND hWnd, LPCTSTR lpText, LPCTSTR lpCaption, UINT uType)
{
	int ret;
	
	ret = OriginalProc(hWnd, lpText, "MsgBox()", uType);

	return ret;
}


int APIENTRY WinMain(HINSTANCE hInstance, HINSTANCE hprev, LPSTR lpCmdLine, int nShowCmd)
{

	MessageBox(0, "This is a normal windows message box", "MessageBox()", MB_OK);
	
	OriginalProc = (MESSAGEBOXPROC)
		HookImportedFunction(
		GetModuleHandle(0), "USER32.DLL", "MessageBoxA", (PROC)MsgBox);

	if(!OriginalProc)
	{
		MessageBox(0, "Couldn't be done!", "ERROR", 0);
		return 0;
	}

	MessageBox(0, "This is another normal windows message box", "MessageBox()", MB_OK);
	
	return 0;
}

  */

#endif