/********************************************************************
Module : Interceptors.cpp - part of CeApiSpyDll implementation 
             Written 2003 by Dmitri Leman
             for an article about CE Api Spy.
Purpose: Contains individual API interceptor routines for
  CreateFile, CreateProcess and LoadLibrary APIs.  
  Function InstallInterceptors is used to install these interceptors.
  This file can be modified to monitor additional API routines.

  This file was compiled using eMbedded Visual C++ 3.0 
  with Pocket PC 2002 SDK and 4.0 with Standard SDK.
********************************************************************/

#include <windows.h>
//Redefinitions for some CE internal structures and undocumented API:
#include "SysDecls.h" 
#include "SpyEngine.h"
#include "HTrace.h"

#pragma data_seg("SH_DATA")
//The following are pointers to the original API routines,
//which our interceptors should invoke.
PFNVOID g_pOrigCreateFile = NULL;
PFNVOID g_pOrigCreateProcess = NULL;
PFNVOID g_pOrigLoadLibrary = NULL;

#pragma data_seg()

/*-------------------------------------------------------------
   FUNCTION: HookCreateFileW
   PURPOSE:  Interceptor for CreateFileW API
   Parameters and return value are identical to the documented
   CreateFile function.
-------------------------------------------------------------*/
HANDLE HookCreateFileW
(
    LPCWSTR p_lpFileName,
    DWORD   p_dwDesiredAccess,
    DWORD   p_dwShareMode,
    LPSECURITY_ATTRIBUTES p_lpSecurityAttributes,
    DWORD   p_dwCreationDisposition,
    DWORD   p_dwFlagsAndAttributes,
    HANDLE  p_hTemplateFile
)
{
    InterlockedIncrement(&g_SpyEngine.m_lNumCalls);
    InterlockedIncrement(&g_SpyEngine.m_lNumHooksActive);

    HANDLE l_hCurProc = GetCurrentProcess();

    DWORD l_dwCurTrace = 
        TraceGetAssignedGroupsToStream((DWORD)-1);
    if(l_dwCurTrace & TG_DebugSpyDetailed)
    {//Don't make extra calls unless trace is enabled
        HTRACE(TG_DebugSpyDetailed, 
            _T("HookCreateFileW enter proc %x owner %x ")
            _T("caller %x call %x\r\n"),
            GetCurrentProcessId(), GetOwnerProcess(), 
            GetCallerProcess(), g_pOrigCreateFile);
    }
 
    HANDLE l_hResult = FALSE;
    if(g_pOrigCreateFile)
    {
        l_hResult = ((HANDLE (*)(
            LPCWSTR, DWORD, DWORD, LPSECURITY_ATTRIBUTES,
            DWORD, DWORD, HANDLE))g_pOrigCreateFile)
            (
                p_lpFileName,
                p_dwDesiredAccess,
                p_dwShareMode,
                p_lpSecurityAttributes,
                p_dwCreationDisposition,
                p_dwFlagsAndAttributes,
                p_hTemplateFile
            );
    }//if(g_pOrigCreateFile)
    
    if(l_dwCurTrace & TG_InterceptedInfo)
    {
        LPCWSTR l_pszMappedName = (LPCWSTR)
            MapPtrToProcess((LPVOID)p_lpFileName, l_hCurProc);

        HTRACE(TG_InterceptedInfo, 
            _T("HookCreateFileW(%x:%s,%x,%x,%x) ret %x err %d\r\n"),
            p_lpFileName, l_pszMappedName,
            p_dwDesiredAccess,
            p_dwShareMode,
            p_dwFlagsAndAttributes,
            l_hResult,
            GetLastError());
    }
    InterlockedDecrement(&g_SpyEngine.m_lNumHooksActive);
    return l_hResult;
}//HANDLE HookCreateFileW

/*-------------------------------------------------------------
   FUNCTION: HookCreateProcessW
   PURPOSE:  Interceptor for CreateProcessW API
   Parameters and return value are identical to the documented
   CreateProcess function.
-------------------------------------------------------------*/
BOOL HookCreateProcessW
(
    LPCWSTR p_lpszImageName,
    LPCWSTR p_lpszCommandLine,
    LPSECURITY_ATTRIBUTES p_lpsaProcess,
    LPSECURITY_ATTRIBUTES p_lpsaThread,
    BOOL p_fInheritHandles,
    DWORD p_fdwCreate,
    LPVOID p_lpvEnvironment,
    LPWSTR p_lpszCurDir,
    LPSTARTUPINFO p_lpsiStartInfo,
    LPPROCESS_INFORMATION p_lppiProcInfo
)
{
    InterlockedIncrement(&g_SpyEngine.m_lNumCalls);
    InterlockedIncrement(&g_SpyEngine.m_lNumHooksActive);

    HANDLE l_hCurProc = GetCurrentProcess();
    
    DWORD l_dwCurTrace = 
        TraceGetAssignedGroupsToStream((DWORD)-1);
    if(l_dwCurTrace & TG_DebugSpyDetailed)
    {//Don't make extra calls unless trace is enabled
        HTRACE(TG_DebugSpyDetailed, 
            _T("HookCreateProcessW enter proc %x owner %x ")
            _T("caller %x call %x\r\n"),
            GetCurrentProcessId(), GetOwnerProcess(), 
            GetCallerProcess(), g_pOrigCreateProcess);
    }
 
    LPCWSTR l_pszMappedName = NULL, l_pszMappedLine = NULL;
    if(l_dwCurTrace & TG_InterceptedInfo)
    {
        l_pszMappedName = (LPCWSTR)
            MapPtrToProcess((LPVOID)p_lpszImageName, l_hCurProc);
        l_pszMappedLine = (LPCWSTR)
            MapPtrToProcess((LPVOID)p_lpszCommandLine, l_hCurProc);
        HTRACE(TG_InterceptedInfo, 
            _T("->HookCreateProcessW(%x:%s,%x:%s)\r\n"),
            p_lpszImageName, l_pszMappedName, 
            p_lpszCommandLine, l_pszMappedLine);
    }

    BOOL l_bResult = FALSE;
    if(g_pOrigCreateProcess)
    {
        l_bResult = ((BOOL (*)(
            LPCWSTR, LPCWSTR, LPSECURITY_ATTRIBUTES, 
            LPSECURITY_ATTRIBUTES, BOOL, DWORD, LPVOID, LPWSTR, 
            LPSTARTUPINFO, LPPROCESS_INFORMATION))
            g_pOrigCreateProcess) (
            p_lpszImageName,
            p_lpszCommandLine,
            p_lpsaProcess,
            p_lpsaThread,
            p_fInheritHandles,
            p_fdwCreate,
            p_lpvEnvironment,
            p_lpszCurDir,
            p_lpsiStartInfo,
            p_lppiProcInfo
        );
    }//if(g_pOrigCreateProcess)
    
    if(l_dwCurTrace & TG_InterceptedInfo)
    {
        HTRACE(TG_InterceptedInfo, 
            _T("<-HookCreateProcessW(%x:%s,%x:%s)ret %x err %d\r\n"),
            p_lpszImageName, l_pszMappedName, 
            p_lpszCommandLine, l_pszMappedLine,
            l_bResult, GetLastError());
    }
    InterlockedDecrement(&g_SpyEngine.m_lNumHooksActive);
    return l_bResult;
}//BOOL HookCreateProcessW

/*-------------------------------------------------------------
   FUNCTION: HookLoadLibraryW
   PURPOSE:  Interceptor for LoadLibraryW API
   Parameters and return value are identical to the documented
   LoadLibraryW function.
-------------------------------------------------------------*/
HANDLE HookLoadLibraryW
(
    LPCTSTR p_lpszFileName
)
{
    InterlockedIncrement(&g_SpyEngine.m_lNumCalls);
    InterlockedIncrement(&g_SpyEngine.m_lNumHooksActive);

    HANDLE l_hCurProc = GetCurrentProcess();
    
    DWORD l_dwCurTrace = 
        TraceGetAssignedGroupsToStream((DWORD)-1);
    if(l_dwCurTrace & TG_DebugSpyDetailed)
    {//Don't make extra calls unless trace is enabled
        HTRACE(TG_DebugSpyDetailed, 
            _T("HookLoadLibraryW enter proc %x owner %x ")
            _T("caller %x call %x\r\n"),
            GetCurrentProcessId(), GetOwnerProcess(), 
            GetCallerProcess(), g_pOrigLoadLibrary);
    }
    LPCWSTR l_pszMappedName = NULL;
    if(l_dwCurTrace & TG_InterceptedInfo)
    {
        l_pszMappedName = (LPCWSTR)
            MapPtrToProcess((LPVOID)p_lpszFileName, l_hCurProc);

        HTRACE(TG_InterceptedInfo, 
            _T("->HookLoadLibraryW(%x:%s)\r\n"),
            p_lpszFileName, l_pszMappedName);
    }
    
    HANDLE l_hResult = FALSE;
    if(g_pOrigLoadLibrary)
    {
        l_hResult = ((HANDLE (*)(LPCTSTR p_lpszFileName))
            g_pOrigLoadLibrary)
            (p_lpszFileName);
    }//if(g_pOrigLoadLibrary)
    
    if(l_dwCurTrace & TG_InterceptedInfo)
    {
        HTRACE(TG_InterceptedInfo, 
            _T("<-HookLoadLibraryW(%x:%s) ret %x err %d\r\n"),
            p_lpszFileName, l_pszMappedName, 
            l_hResult, GetLastError());
    }
    InterlockedDecrement(&g_SpyEngine.m_lNumHooksActive);
    return l_hResult;
}//HANDLE HookLoadLibraryW

/*-------------------------------------------------------------
   FUNCTION: InstallInterceptors
   PURPOSE:  Customizable routine, which is called by the Spy
   engine to install individual interceptors.
-------------------------------------------------------------*/
BOOL InstallInterceptors()
{
    g_pOrigCreateFile = g_SpyEngine.HookMethod
        (SH_FILESYS_APIS, FILESYS_CreateFile, 
        (PFNVOID)HookCreateFileW);
    g_pOrigCreateProcess = g_SpyEngine.HookMethod
        (SH_WIN32, W32_CreateProc, 
        (PFNVOID)HookCreateProcessW);
    g_pOrigLoadLibrary = g_SpyEngine.HookMethod
        (SH_WIN32, W32_LoadLibraryW, 
        (PFNVOID)HookLoadLibraryW);

    //test CreateFile hook
    HTRACE(TG_InterceptedInfo, _T("Before test CreateFile"));
    CreateFile(_T("Test file"), GENERIC_READ, 0, 
        NULL, OPEN_EXISTING, 0, NULL);
    HTRACE(TG_InterceptedInfo, _T("After test CreateFile"));

    return TRUE;
}//BOOL InstallInterceptors()
