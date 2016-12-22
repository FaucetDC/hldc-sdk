//Lol, no, this isn't build for win64
//32bit address spacing only..


#include <windows.h>
#include "HookAPI.h"
#include <iostream>
#define Append(text) AppendLog(text, strlen(text))
#define LogFile "d:\\logs\\sniffer\\LOG.txt"

using namespace std;

/////
	//////////
	
	HINSTANCE			g_hInst=0;
	HANDLE				hLogFile=0;

	///

	HANDLE OpenLog(char *Filename);
	BOOL CloseLog(HANDLE h=hLogFile);
	DWORD AppendLog(char *str, DWORD uSize, HANDLE h=hLogFile);
	int HookWinsockProcs();

	///

	BOOL				IsLogging=false;

	//////////
////


BOOL WINAPI DllMain(HINSTANCE hInstance, DWORD dwReason, LPVOID _Reserved)
{
	switch(dwReason)
	{
	case DLL_PROCESS_ATTACH:
		g_hInst = hInstance;
		hLogFile = OpenLog(LogFile);
		Append("\r\n************************\r\nDLL_PROCESS_ATTACH\r\n");
		HookWinsockProcs();

		return true;
		break;

	case DLL_THREAD_ATTACH:
		Append("DLL_THREAD_ATTACH\r\n");
		break;

	case DLL_THREAD_DETACH:
		Append("DLL_THREAD_DETACH\r\n");
		break;

	case DLL_PROCESS_DETACH:
		Append("DLL_PROCESS_DETACH\r\n********************\r\n\r\n");
		CloseLog();
		return true;
		break;
	}//end switch(dwReason)

	return true;
}

//===========================
//  Related to LOG file
//
HANDLE OpenLog(char *Filename)
{
	HANDLE hLogFile;

	hLogFile = CreateFile( Filename, GENERIC_WRITE, FILE_SHARE_READ, 0, OPEN_ALWAYS,0,0);
	if(hLogFile!=INVALID_HANDLE_VALUE)
		IsLogging = true;//SetFilePointer(hLogFile, 0,0, FILE_END);//*/
	
	return hLogFile;
}

BOOL CloseLog(HANDLE h)
{
	IsLogging = false;
	return CloseHandle(h);
}

//returns written bytes
DWORD AppendLog(char *str, DWORD uSize, HANDLE h)
{
	DWORD written;
	if(!IsLogging) return 0;

	SetFilePointer( h, 0, 0, FILE_END );
	WriteFile(h, str, uSize, &written, 0);

	return written;
}
//
//
//============================
