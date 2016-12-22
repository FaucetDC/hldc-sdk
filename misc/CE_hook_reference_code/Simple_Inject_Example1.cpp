// Code obtained from http://wmdevelopers.blogspot.com/2008/05/inject-dlls.html
// Needs a certain version of pkfuncs.h that isn't included in WCE Dreamcast SDK. Version I found doesn't work

/*
Hi,
today i'll explain how inject dlls into another process.

To inject external dlls into the processes we need to use some functions exported from coredll.dll. 
These functions are documented in Platform Builder but not in SDK so we need to declare them as extern:
*/
#include <windows.h>
#include <winbase.h>
#include <commdlg.h>
#include <toolhelp_ce.h>
#include "resource.h"
#include "SpyControl.h"
#include "SpyEngine.h"
#include "SysDecls.h"
#include "htrace.h"

extern "C"
{
BOOL __stdcall SetKMode(BOOL fMode);
DWORD __stdcall SetProcPermissions(DWORD);
LPVOID __stdcall MapPtrToProcess (LPVOID lpv, HANDLE hProc);
struct CALLBACKINFO 
{
HANDLE m_hDestProcess;
FARPROC m_pFunction;
PVOID m_pFirstArgument;
};
DWORD __stdcall PerformCallBack4(CALLBACKINFO *pcbi, DWORD dw1, DWORD dw2, DWORD dw3);
}

/*
After declared the undocumented functions we need to write code to use them to inject dlls, so:
*/

//change the kernelmode and the permission for our code
BOOL bMode = SetKMode(TRUE);
DWORD dwPerm = SetProcPermissions(0xFFFFFFFF);

CALLBACKINFO cbi;
cbi.m_hDestProcess = hProcess;
cbi.m_pFunction = (FARPROC)MapPtrToProcess(GetProcAddress(GetModuleHandle(L"COREDLL"), L"LoadLibraryW"), hProcess);
cbi.m_pFirstArgument = (LPVOID)MapPtrToProcess(lpszFullPathDll, GetCurrentProcess());
HINSTANCE hInst = (HINSTANCE)PerformCallBack4(&cbi, 0,0,0); //returns the HINSTANCE from LoadLibraryW

//restore kernelmode and permission
SetKMode(bMode);
SetProcPermissions(dwPerm);

/*
Some details:
hProcess: is the handle of the process where the dll will be injected;
lpszFullPathDll: is the full path to the dll which must be injected;

After a dll is injected into the hProcess we can call every exported function with the same method:
*/

//get the proc address
FARPROC pHook = GetProcAddress(hInst, (LPCTSTR)L"ExportedFunction");
cbi.m_hDestProcess = hProcess;
cbi.m_pFunction = (FARPROC)MapPtrToProcess(pHook, hProcess);
cbi.m_pFirstArgument = NULL; //here we can pass any argument for our 'ExportedFunction'
DWORD dw = PerformCallBack4(&cbi, 0, 0, 0);//returns the same value of 'ExportedFunction'

/*
And finally, as we loaded the dll, we can unload it calling 'FreeLibrary':
*/

cbi.m_hDestProcess = hProcess;
cbi.m_pFunction = (FARPROC)MapPtrToProcess(GetProcAddress(GetModuleHandle(L"COREDLL"), L"FreeLibrary"), hProcess);
cbi.m_pFirstArgument = hInst; //HINSTANCE returned by LoadLibrary
DWORD dw = PerformCallBack4(&cbi, 0,0,0); //returns 1 if correctly unloaded

/*
Enjoy!
:)
*/