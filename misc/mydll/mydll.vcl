<html>
<body>
<pre>
<h1>Build Log</h1>
<h3>
--------------------Configuration: mydll - Win32 (WCE ARMV4) Release--------------------
</h3>
<h3>Command Lines</h3>
Creating command line "rc.exe /l 0x409 /fo"ARMV4Rel/mydll.res" /d UNDER_CE=420 /d _WIN32_WCE=420 /d "NDEBUG" /d "UNICODE" /d "_UNICODE" /d "WIN32_PLATFORM_PSPC=400" /d "ARM" /d "_ARM_" /d "ARMV4" /d "_AFXDLL" /r "C:\Program Files\Microsoft eMbedded C++ 4.0\Common\EVC\MyProjects\mydll\mydll.rc"" 
Creating temporary file "C:\DOCUME~1\emran\LOCALS~1\Temp\RSPF75.tmp" with contents
[
/nologo /W3 /D "ARM" /D "_ARM_" /D "ARMV4" /D UNDER_CE=420 /D _WIN32_WCE=420 /D "WIN32_PLATFORM_PSPC=400" /D "UNICODE" /D "_UNICODE" /D "NDEBUG" /D "_AFXDLL" /D "_USRDLL" /FR"ARMV4Rel/" /Fp"ARMV4Rel/mydll.pch" /Yu"stdafx.h" /Fo"ARMV4Rel/" /O2 /MC   /c 
"C:\Program Files\Microsoft eMbedded C++ 4.0\Common\EVC\MyProjects\mydll\mydll.cpp"
]
Creating command line "clarm.exe @C:\DOCUME~1\emran\LOCALS~1\Temp\RSPF75.tmp" 
Creating temporary file "C:\DOCUME~1\emran\LOCALS~1\Temp\RSPF76.tmp" with contents
[
/nologo /W3 /D "ARM" /D "_ARM_" /D "ARMV4" /D UNDER_CE=420 /D _WIN32_WCE=420 /D "WIN32_PLATFORM_PSPC=400" /D "UNICODE" /D "_UNICODE" /D "NDEBUG" /D "_AFXDLL" /D "_USRDLL" /FR"ARMV4Rel/" /Fp"ARMV4Rel/mydll.pch" /Yc"stdafx.h" /Fo"ARMV4Rel/" /O2 /MC   /c 
"C:\Program Files\Microsoft eMbedded C++ 4.0\Common\EVC\MyProjects\mydll\StdAfx.cpp"
]
Creating command line "clarm.exe @C:\DOCUME~1\emran\LOCALS~1\Temp\RSPF76.tmp" 
Creating temporary file "C:\DOCUME~1\emran\LOCALS~1\Temp\RSPF77.tmp" with contents
[
/nologo /base:"0x00100000" /stack:0x10000,0x1000 /entry:"_DllMainCRTStartup" /dll /incremental:no /pdb:"ARMV4Rel/mydll.pdb" /def:".\mydll.def" /out:"ARMV4Rel/mydll.dll" /implib:"ARMV4Rel/mydll.lib" /subsystem:windowsce,4.20 /align:"4096" /MACHINE:ARM 
".\ARMV4Rel\mydll.obj"
".\ARMV4Rel\StdAfx.obj"
".\ARMV4Rel\mydll.res"
]
Creating command line "link.exe @C:\DOCUME~1\emran\LOCALS~1\Temp\RSPF77.tmp"
<h3>Output Window</h3>
Compiling resources...
Compiling...
StdAfx.cpp
Compiling...
mydll.cpp
Linking...
   Creating library ARMV4Rel/mydll.lib and object ARMV4Rel/mydll.exp
Creating command line "bscmake.exe /nologo /o"ARMV4Rel/mydll.bsc"  ".\ARMV4Rel\StdAfx.sbr" ".\ARMV4Rel\mydll.sbr""
Creating browse info file...
<h3>Output Window</h3>




<h3>Results</h3>
mydll.dll - 0 error(s), 0 warning(s)
</pre>
</body>
</html>
