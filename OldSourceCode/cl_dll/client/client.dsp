# Microsoft Developer Studio Project File - Name="client" - Package Owner=<4>
# Microsoft Developer Studio Generated Build File, Format Version 6.00
# ** DO NOT EDIT **

# TARGTYPE "Win32 (WCE SH4) Dynamic-Link Library" 0x8602

CFG=client - Win32 (WCE SH4) Debug
!MESSAGE This is not a valid makefile. To build this project using NMAKE,
!MESSAGE use the Export Makefile command and run
!MESSAGE 
!MESSAGE NMAKE /f "client.mak".
!MESSAGE 
!MESSAGE You can specify a configuration when running NMAKE
!MESSAGE by defining the macro CFG on the command line. For example:
!MESSAGE 
!MESSAGE NMAKE /f "client.mak" CFG="client - Win32 (WCE SH4) Debug"
!MESSAGE 
!MESSAGE Possible choices for configuration are:
!MESSAGE 
!MESSAGE "client - Win32 (WCE SH4) Release" (based on "Win32 (WCE SH4) Dynamic-Link Library")
!MESSAGE "client - Win32 (WCE SH4) Debug" (based on "Win32 (WCE SH4) Dynamic-Link Library")
!MESSAGE 

# Begin Project
# PROP AllowPerConfigDependencies 0
# PROP Scc_ProjName ""
# PROP Scc_LocalPath "Dreamcast"
# PROP WCE_FormatVersion "6.0"
CPP=shcl.exe
MTL=midl.exe
RSC=rc.exe

!IF  "$(CFG)" == "client - Win32 (WCE SH4) Release"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 0
# PROP BASE Output_Dir "WCESH4Rel"
# PROP BASE Intermediate_Dir "WCESH4Rel"
# PROP BASE Target_Dir ""
# PROP Use_MFC 0
# PROP Use_Debug_Libraries 0
# PROP Output_Dir "WCESH4Rel"
# PROP Intermediate_Dir "WCESH4Rel"
# PROP Target_Dir ""
# ADD BASE CPP /nologo /MC /W3 /Zi /Ox /D _WIN32_WCE=$(CEVersion) /D "$(CEConfigName)" /D "NDEBUG" /D "SHx" /D "SH4" /D "_SH4_" /D UNDER_CE=$(CEVersion) /D "UNICODE" /D "_MBCS" /D "_USRDLL" /D "_UNICODE" /YX /Qsh4r7 /Qs /Qfast  /Qgvp /c
# ADD CPP /nologo /MC /W3 /Zi /Ox /D _WIN32_WCE=$(CEVersion) /D "$(CEConfigName)" /D "NDEBUG" /D "SHx" /D "SH4" /D "_SH4_" /D UNDER_CE=$(CEVersion) /D "UNICODE" /D "_MBCS" /D "_USRDLL" /D "_UNICODE" /YX /Qsh4r7 /Qs /Qfast  /Qgvp /c
# ADD BASE RSC /l 0x409 /r /d "SHx" /d "SH4" /d "_SH4_" /d UNDER_CE=$(CEVersion) /d _WIN32_WCE=$(CEVersion) /d "$(CEConfigName)" /d "UNICODE" /d "NDEBUG"
# ADD RSC /l 0x409 /r /d "SHx" /d "SH4" /d "_SH4_" /d UNDER_CE=$(CEVersion) /d _WIN32_WCE=$(CEVersion) /d "$(CEConfigName)" /d "UNICODE" /d "NDEBUG"
# ADD BASE MTL /nologo /D "NDEBUG" /mktyplib203 /o "NUL" /win32
# ADD MTL /nologo /D "NDEBUG" /mktyplib203 /o "NUL" /win32
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LINK32=link.exe
# ADD BASE LINK32 coredll.lib /nologo /dll /machine:SH4 /nodefaultlib:"$(CENoDefaultLib)" /subsystem:$(CESubsystem) /STACK:65536,4096
# ADD LINK32 coredll.lib /nologo /dll /machine:SH4 /nodefaultlib:"$(CENoDefaultLib)" /subsystem:$(CESubsystem) /STACK:65536,4096

!ELSEIF  "$(CFG)" == "client - Win32 (WCE SH4) Debug"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 1
# PROP BASE Output_Dir "WCESH4Dbg"
# PROP BASE Intermediate_Dir "WCESH4Dbg"
# PROP BASE Target_Dir ""
# PROP Use_MFC 0
# PROP Use_Debug_Libraries 1
# PROP Output_Dir "WCESH4Dbg"
# PROP Intermediate_Dir "WCESH4Dbg"
# PROP Target_Dir ""
# ADD BASE CPP /nologo /MC /W3 /Zi /Od /D _WIN32_WCE=$(CEVersion) /D "$(CEConfigName)" /D "DEBUG" /D "SHx" /D "SH4" /D "_SH4_" /D UNDER_CE=$(CEVersion) /D "UNICODE" /D "_MBCS" /D "_USRDLL" /D "_UNICODE" /YX /Qsh4r7 /Qs /Qfast  /c
# ADD CPP /nologo /MC /W3 /Zi /Od /D _WIN32_WCE=$(CEVersion) /D "$(CEConfigName)" /D "DEBUG" /D "SHx" /D "SH4" /D "_SH4_" /D UNDER_CE=$(CEVersion) /D "UNICODE" /D "_MBCS" /D "_USRDLL" /D "_UNICODE" /YX /Qsh4r7 /Qs /Qfast  /c
# ADD BASE RSC /l 0x409 /r /d "SHx" /d "SH4" /d "_SH4_" /d UNDER_CE=$(CEVersion) /d _WIN32_WCE=$(CEVersion) /d "$(CEConfigName)" /d "UNICODE" /d "DEBUG"
# ADD RSC /l 0x409 /r /d "SHx" /d "SH4" /d "_SH4_" /d UNDER_CE=$(CEVersion) /d _WIN32_WCE=$(CEVersion) /d "$(CEConfigName)" /d "UNICODE" /d "DEBUG"
# ADD BASE MTL /nologo /D "_DEBUG" /mktyplib203 /o "NUL" /win32
# ADD MTL /nologo /D "_DEBUG" /mktyplib203 /o "NUL" /win32
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LINK32=link.exe
# ADD BASE LINK32 coredll.lib /nologo /dll /debug /machine:SH4 /nodefaultlib:"$(CENoDefaultLib)" /subsystem:$(CESubsystem) /STACK:65536,4096
# ADD LINK32 coredll.lib /nologo /dll /debug /machine:SH4 /nodefaultlib:"$(CENoDefaultLib)" /subsystem:$(CESubsystem) /STACK:65536,4096

!ENDIF 

# Begin Target

# Name "client - Win32 (WCE SH4) Release"
# Name "client - Win32 (WCE SH4) Debug"
# Begin Group "Source Files"

# PROP Default_Filter "cpp;c;cxx;rc;def;r;odl;idl;hpj;bat"
# Begin Source File

SOURCE=..\ammo.cpp
DEP_CPP_AMMO_=\
	"..\..\dlls\cdll_dll.h"\
	"..\..\engine\cdll_int.h"\
	"..\ammo.h"\
	"..\ammohistory.h"\
	"..\cl_dll.h"\
	"..\health.h"\
	"..\hud.h"\
	"..\parsemsg.h"\
	"..\util_vector.h"\
	
# End Source File
# Begin Source File

SOURCE=..\ammo_secondary.cpp
DEP_CPP_AMMO_S=\
	"..\..\dlls\cdll_dll.h"\
	"..\..\engine\cdll_int.h"\
	"..\ammo.h"\
	"..\cl_dll.h"\
	"..\health.h"\
	"..\hud.h"\
	"..\parsemsg.h"\
	"..\util_vector.h"\
	
# End Source File
# Begin Source File

SOURCE=..\ammohistory.cpp
DEP_CPP_AMMOH=\
	"..\..\dlls\cdll_dll.h"\
	"..\..\engine\cdll_int.h"\
	"..\ammo.h"\
	"..\ammohistory.h"\
	"..\cl_dll.h"\
	"..\health.h"\
	"..\hud.h"\
	"..\parsemsg.h"\
	"..\util_vector.h"\
	
# End Source File
# Begin Source File

SOURCE=..\battery.cpp
DEP_CPP_BATTE=\
	"..\..\dlls\cdll_dll.h"\
	"..\..\engine\cdll_int.h"\
	"..\ammo.h"\
	"..\cl_dll.h"\
	"..\health.h"\
	"..\hud.h"\
	"..\parsemsg.h"\
	"..\util_vector.h"\
	
# End Source File
# Begin Source File

SOURCE=..\cdll_int.cpp
DEP_CPP_CDLL_=\
	"..\..\dlls\cdll_dll.h"\
	"..\..\engine\cdll_int.h"\
	"..\ammo.h"\
	"..\cl_dll.h"\
	"..\health.h"\
	"..\hud.h"\
	"..\util_vector.h"\
	
# End Source File
# Begin Source File

SOURCE=..\death.cpp
DEP_CPP_DEATH=\
	"..\..\dlls\cdll_dll.h"\
	"..\..\engine\cdll_int.h"\
	"..\ammo.h"\
	"..\cl_dll.h"\
	"..\health.h"\
	"..\hud.h"\
	"..\parsemsg.h"\
	"..\util_vector.h"\
	
# End Source File
# Begin Source File

SOURCE=..\flashlight.cpp
DEP_CPP_FLASH=\
	"..\..\dlls\cdll_dll.h"\
	"..\..\engine\cdll_int.h"\
	"..\ammo.h"\
	"..\cl_dll.h"\
	"..\health.h"\
	"..\hud.h"\
	"..\parsemsg.h"\
	"..\util_vector.h"\
	
# End Source File
# Begin Source File

SOURCE=..\geiger.cpp
DEP_CPP_GEIGE=\
	"..\..\dlls\cdll_dll.h"\
	"..\..\engine\cdll_int.h"\
	"..\ammo.h"\
	"..\cl_dll.h"\
	"..\health.h"\
	"..\hud.h"\
	"..\parsemsg.h"\
	"..\util_vector.h"\
	
# End Source File
# Begin Source File

SOURCE=..\health.cpp
DEP_CPP_HEALT=\
	"..\..\dlls\cdll_dll.h"\
	"..\..\engine\cdll_int.h"\
	"..\ammo.h"\
	"..\cl_dll.h"\
	"..\health.h"\
	"..\hud.h"\
	"..\parsemsg.h"\
	"..\util_vector.h"\
	
# End Source File
# Begin Source File

SOURCE=..\hud.cpp
DEP_CPP_HUD_C=\
	"..\..\dlls\cdll_dll.h"\
	"..\..\engine\cdll_int.h"\
	"..\ammo.h"\
	"..\cl_dll.h"\
	"..\health.h"\
	"..\hud.h"\
	"..\parsemsg.h"\
	"..\util_vector.h"\
	
# End Source File
# Begin Source File

SOURCE=..\hud_msg.cpp
DEP_CPP_HUD_M=\
	"..\..\dlls\cdll_dll.h"\
	"..\..\engine\cdll_int.h"\
	"..\ammo.h"\
	"..\cl_dll.h"\
	"..\health.h"\
	"..\hud.h"\
	"..\parsemsg.h"\
	"..\util_vector.h"\
	
# End Source File
# Begin Source File

SOURCE=..\hud_redraw.cpp
DEP_CPP_HUD_R=\
	"..\..\dlls\cdll_dll.h"\
	"..\..\engine\cdll_int.h"\
	"..\ammo.h"\
	"..\cl_dll.h"\
	"..\health.h"\
	"..\hud.h"\
	"..\util_vector.h"\
	
# End Source File
# Begin Source File

SOURCE=..\hud_update.cpp
DEP_CPP_HUD_U=\
	"..\..\dlls\cdll_dll.h"\
	"..\..\engine\cdll_int.h"\
	"..\ammo.h"\
	"..\cl_dll.h"\
	"..\health.h"\
	"..\hud.h"\
	"..\util_vector.h"\
	
# End Source File
# Begin Source File

SOURCE=..\menu.cpp
DEP_CPP_MENU_=\
	"..\..\dlls\cdll_dll.h"\
	"..\..\engine\cdll_int.h"\
	"..\ammo.h"\
	"..\cl_dll.h"\
	"..\health.h"\
	"..\hud.h"\
	"..\parsemsg.h"\
	"..\util_vector.h"\
	
# End Source File
# Begin Source File

SOURCE=..\message.cpp
DEP_CPP_MESSA=\
	"..\..\dlls\cdll_dll.h"\
	"..\..\engine\cdll_int.h"\
	"..\ammo.h"\
	"..\cl_dll.h"\
	"..\health.h"\
	"..\hud.h"\
	"..\parsemsg.h"\
	"..\util_vector.h"\
	
# End Source File
# Begin Source File

SOURCE=..\MOTD.cpp
DEP_CPP_MOTD_=\
	"..\..\dlls\cdll_dll.h"\
	"..\..\engine\cdll_int.h"\
	"..\ammo.h"\
	"..\cl_dll.h"\
	"..\health.h"\
	"..\hud.h"\
	"..\parsemsg.h"\
	"..\util_vector.h"\
	
# End Source File
# Begin Source File

SOURCE=..\parsemsg.cpp
# End Source File
# Begin Source File

SOURCE=..\saytext.cpp
DEP_CPP_SAYTE=\
	"..\..\dlls\cdll_dll.h"\
	"..\..\engine\cdll_int.h"\
	"..\ammo.h"\
	"..\cl_dll.h"\
	"..\health.h"\
	"..\hud.h"\
	"..\parsemsg.h"\
	"..\util_vector.h"\
	
# End Source File
# Begin Source File

SOURCE=..\scoreboard.cpp
DEP_CPP_SCORE=\
	"..\..\dlls\cdll_dll.h"\
	"..\..\engine\cdll_int.h"\
	"..\ammo.h"\
	"..\cl_dll.h"\
	"..\health.h"\
	"..\hud.h"\
	"..\parsemsg.h"\
	"..\stricmp_ce.h"\
	"..\util_vector.h"\
	
# End Source File
# Begin Source File

SOURCE=..\status_icons.cpp
DEP_CPP_STATU=\
	"..\..\dlls\cdll_dll.h"\
	"..\..\engine\cdll_int.h"\
	"..\ammo.h"\
	"..\cl_dll.h"\
	"..\health.h"\
	"..\hud.h"\
	"..\parsemsg.h"\
	"..\util_vector.h"\
	
# End Source File
# Begin Source File

SOURCE=..\statusbar.cpp
DEP_CPP_STATUS=\
	"..\..\dlls\cdll_dll.h"\
	"..\..\engine\cdll_int.h"\
	"..\ammo.h"\
	"..\cl_dll.h"\
	"..\health.h"\
	"..\hud.h"\
	"..\parsemsg.h"\
	"..\util_vector.h"\
	
# End Source File
# Begin Source File

SOURCE=..\text_message.cpp
DEP_CPP_TEXT_=\
	"..\..\dlls\cdll_dll.h"\
	"..\..\engine\cdll_int.h"\
	"..\ammo.h"\
	"..\cl_dll.h"\
	"..\health.h"\
	"..\hud.h"\
	"..\parsemsg.h"\
	"..\util_vector.h"\
	
# End Source File
# Begin Source File

SOURCE=..\train.cpp
DEP_CPP_TRAIN=\
	"..\..\dlls\cdll_dll.h"\
	"..\..\engine\cdll_int.h"\
	"..\ammo.h"\
	"..\cl_dll.h"\
	"..\health.h"\
	"..\hud.h"\
	"..\parsemsg.h"\
	"..\util_vector.h"\
	
# End Source File
# Begin Source File

SOURCE=..\util.cpp
DEP_CPP_UTIL_=\
	"..\..\dlls\cdll_dll.h"\
	"..\..\engine\cdll_int.h"\
	"..\ammo.h"\
	"..\cl_dll.h"\
	"..\health.h"\
	"..\hud.h"\
	"..\util_vector.h"\
	
# End Source File
# End Group
# Begin Group "Header Files"

# PROP Default_Filter "h;hpp;hxx;hm;inl"
# Begin Source File

SOURCE=.\stricmp_ce.h
# End Source File
# End Group
# Begin Group "Resource Files"

# PROP Default_Filter "ico;cur;bmp;dlg;rc2;rct;bin;rgs;gif;jpg;jpeg;jpe"
# End Group
# Begin Source File

SOURCE=.\readme.txt
# End Source File
# End Target
# End Project
