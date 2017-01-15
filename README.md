# Half-Life Dreamcast SDK
-----------------------

This project aims to contain:

GoldSRC extension DLLs ported to Windows CE for Sega Dreamcast. Based on Half-Life SDK version 2.1

En4CEr - DLL Injector application for Windows CE 2.12

-----------------------

Project files are for Visual C++ 6.0

Windows CE client.dll is located in cl_dll\client\client.dsw

Windows CE hl.dll is located in dlls\hl\hl.dsw

-----------------------

Project Status:

OldSourceCode - Source code tree for client.dll and game.dll. Completed, will compile "out of the box" for Windows CE SH4 (Dreamcast)

SourceCode - Latest source code tree (for HLSDK 2.1), this still has errors and is not completed

En4CEr - Windows CE API Interceptor/DLL Injector for Windows CE. Only 3 linker errors. Needs to be adapted for the specific task of injecting client.dll. Requires "211INC" to be the highest priority include directory
