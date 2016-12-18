#include <windows.h>

extern "C" void __stdcall DllExport();

int WINAPI WinMain
(
    HINSTANCE hInstance, 
    HINSTANCE hPrevInstance, 
    LPWSTR lpCmdLine, 
    int nShowCmd 
)
{
    MessageBox(NULL, _T("Application loaded. Click OK to terminate"),
        _T("Missing DLL test"), MB_TOPMOST | MB_SETFOREGROUND);
    DllExport();
    return 1;
}
