<html>
<body>
<pre>
<h1>Build Log</h1>
<h3>
--------------------Configuration: injectProcess - Win32 (WCE ARMV4) Release--------------------
</h3>
<h3>Command Lines</h3>
Creating command line "rc.exe /l 0x409 /fo"ARMV4Rel/injectProcess.res" /d UNDER_CE=420 /d _WIN32_WCE=420 /d "NDEBUG" /d "UNICODE" /d "_UNICODE" /d "WIN32_PLATFORM_PSPC=400" /d "ARM" /d "_ARM_" /d "ARMV4" /d "_AFXDLL" /r "C:\Program Files\Microsoft eMbedded C++ 4.0\Common\EVC\MyProjects\injectProcess\injectProcess.rc"" 
Creating temporary file "C:\DOCUME~1\emran\LOCALS~1\Temp\RSPE5C.tmp" with contents
[
/nologo /W3 /D "ARM" /D "_ARM_" /D "ARMV4" /D UNDER_CE=420 /D _WIN32_WCE=420 /D "WIN32_PLATFORM_PSPC=400" /D "UNICODE" /D "_UNICODE" /D "NDEBUG" /D "_AFXDLL" /FR"ARMV4Rel/" /Fp"ARMV4Rel/injectProcess.pch" /Yu"stdafx.h" /Fo"ARMV4Rel/" /O2 /MC /c 
"C:\Program Files\Microsoft eMbedded C++ 4.0\Common\EVC\MyProjects\injectProcess\injectProcess.cpp"
"C:\Program Files\Microsoft eMbedded C++ 4.0\Common\EVC\MyProjects\injectProcess\injectProcessDlg.cpp"
]
Creating command line "clarm.exe @C:\DOCUME~1\emran\LOCALS~1\Temp\RSPE5C.tmp" 
Creating temporary file "C:\DOCUME~1\emran\LOCALS~1\Temp\RSPE5D.tmp" with contents
[
/nologo /W3 /D "ARM" /D "_ARM_" /D "ARMV4" /D UNDER_CE=420 /D _WIN32_WCE=420 /D "WIN32_PLATFORM_PSPC=400" /D "UNICODE" /D "_UNICODE" /D "NDEBUG" /D "_AFXDLL" /FR"ARMV4Rel/" /Fp"ARMV4Rel/injectProcess.pch" /Yc"stdafx.h" /Fo"ARMV4Rel/" /O2 /MC /c 
"C:\Program Files\Microsoft eMbedded C++ 4.0\Common\EVC\MyProjects\injectProcess\StdAfx.cpp"
]
Creating command line "clarm.exe @C:\DOCUME~1\emran\LOCALS~1\Temp\RSPE5D.tmp" 
Creating temporary file "C:\DOCUME~1\emran\LOCALS~1\Temp\RSPE5E.tmp" with contents
[
/nologo /base:"0x00010000" /stack:0x10000,0x1000 /entry:"wWinMainCRTStartup" /incremental:no /pdb:"ARMV4Rel/injectProcess.pdb" /out:"ARMV4Rel/injectProcess.exe" /subsystem:windowsce,4.20 /align:"4096" /MACHINE:ARM 
".\ARMV4Rel\injectProcess.obj"
".\ARMV4Rel\injectProcessDlg.obj"
".\ARMV4Rel\StdAfx.obj"
".\ARMV4Rel\injectProcess.res"
]
Creating command line "link.exe @C:\DOCUME~1\emran\LOCALS~1\Temp\RSPE5E.tmp"
<h3>Output Window</h3>
Compiling resources...
Compiling...
StdAfx.cpp
Compiling...
injectProcess.cpp
injectProcessDlg.cpp
Generating Code...
Linking...
Creating command line "bscmake.exe /nologo /o"ARMV4Rel/injectProcess.bsc"  ".\ARMV4Rel\StdAfx.sbr" ".\ARMV4Rel\injectProcess.sbr" ".\ARMV4Rel\injectProcessDlg.sbr""
Creating browse info file...
<h3>Output Window</h3>




<h3>Results</h3>
injectProcess.exe - 0 error(s), 0 warning(s)
</pre>
</body>
</html>
