#include <windows.h>

BOOL WINAPI DllMain(HANDLE hinstDLL, DWORD dwReason, LPVOID lpvReserved)
{
    switch(dwReason)
    {
        case DLL_PROCESS_ATTACH:
            MessageBox(NULL, _T("DllMain . DLL_PROCESS_ATTACH"),
                _T("Missing DLL test"), MB_TOPMOST | MB_SETFOREGROUND);
            break;
        case DLL_PROCESS_DETACH:
            MessageBox(NULL, _T("DllMain . DLL_PROCESS_DETACH"),
                _T("Missing DLL test"), MB_TOPMOST | MB_SETFOREGROUND);
            break;
    }
    return TRUE;
}

extern "C" __declspec(dllexport) void __stdcall DllExport()
{
}
