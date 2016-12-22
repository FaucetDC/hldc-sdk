#include "stdafx.h"
#include <Tlhelp32.h>
#pragma comment(lib ,"toolhelp.lib")
typedef struct _CALLBACKINFO {
    HANDLE  hProc;      /* destination process */
    FARPROC pfn;        /* function to call in dest. process */
    PVOID   pvArg0;     /* arg0 data */
} CALLBACKINFO;
typedef CALLBACKINFO *PCALLBACKINFO;

extern "C" {
	BOOL    SetKMode(BOOL fMode);
	DWORD   SetProcPermissions(DWORD);
	LPVOID  MapPtrToProcess (LPVOID lpv, HANDLE hProc);
	DWORD   PerformCallBack4(PCALLBACKINFO pcbi, ...);//execute function inside process
}


HANDLE GetProcessHandle(LPCTSTR wszProcessName )
{
    HANDLE hTH= CreateToolhelp32Snapshot(TH32CS_SNAPPROCESS, 0);

    PROCESSENTRY32 pe;
    pe.dwSize= sizeof(PROCESSENTRY32);

    HANDLE hProc= INVALID_HANDLE_VALUE;
    if (Process32First(hTH, &pe))
    {
        do {
		
            if (wcscmp(wszProcessName, pe.szExeFile)==0)
            {
                hProc= OpenProcess(0, 0, pe.th32ProcessID);
                if (hProc != INVALID_HANDLE_VALUE && hProc!=NULL)
                    break;
            }
        } while (Process32Next(hTH, &pe));
    }

    CloseToolhelp32Snapshot(hTH);

    return hProc;
}