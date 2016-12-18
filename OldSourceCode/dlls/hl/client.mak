# Microsoft Developer Studio Generated NMAKE File, Based on client.dsp
!IF "$(CFG)" == ""
CFG=client - Win32 (WCE SH4) Debug
!MESSAGE No configuration specified. Defaulting to client - Win32 (WCE SH4) Debug.
!ENDIF 

!IF "$(CESubsystem)" == ""
CESubsystem=windowsce,2.0
!MESSAGE Variable CESubsystem not specified. Defaulting to windowsce,2.0
!ENDIF 

!IF "$(CEVersion)" == ""
CEVersion=200
!MESSAGE Variable CEVersion not specified. Defaulting to 200
!ENDIF 

!IF "$(CEConfigName)" == ""
CEConfigName=H/PC Ver. 2.00
!MESSAGE Variable CEConfigName not specified.  Defaulting to H/PC Ver. 2.00
!ENDIF 

!IF $(CEVersion) < 201
CECrt=L
CECrtDebug=Ld
CECrtMT=T
CECrtMTDebug=Td
CENoDefaultLib=corelibc.lib
CEx86Corelibc= 
!ELSE 
CECrt=C
CECrtDebug=C
CECrtMT=C
CECrtMTDebug=C
CENoDefaultLib=libc.lib /nodefaultlib:libcd.lib /nodefaultlib:libcmt.lib /nodefaultlib:libcmtd.lib /nodefaultlib:msvcrt.lib /nodefaultlib:msvcrtd.lib
CEx86Corelibc=corelibc.lib
!ENDIF 

!IF "$(CFG)" != "client - Win32 (WCE SH4) Release" && "$(CFG)" != "client - Win32 (WCE SH4) Debug"
!MESSAGE Invalid configuration "$(CFG)" specified.
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
!ERROR An invalid configuration is specified.
!ENDIF 

!IF "$(OS)" == "Windows_NT"
NULL=
!ELSE 
NULL=nul
!ENDIF 

!IF  "$(CFG)" == "client - Win32 (WCE SH4) Release"

OUTDIR=.\WCESH4Rel
INTDIR=.\WCESH4Rel
# Begin Custom Macros
OutDir=.\WCESH4Rel
# End Custom Macros

ALL : "$(OUTDIR)\client.dll"


CLEAN :
	-@erase "$(INTDIR)\ammo.obj"
	-@erase "$(INTDIR)\ammo_secondary.obj"
	-@erase "$(INTDIR)\ammohistory.obj"
	-@erase "$(INTDIR)\battery.obj"
	-@erase "$(INTDIR)\cdll_int.obj"
	-@erase "$(INTDIR)\death.obj"
	-@erase "$(INTDIR)\flashlight.obj"
	-@erase "$(INTDIR)\geiger.obj"
	-@erase "$(INTDIR)\health.obj"
	-@erase "$(INTDIR)\hud.obj"
	-@erase "$(INTDIR)\hud_msg.obj"
	-@erase "$(INTDIR)\hud_redraw.obj"
	-@erase "$(INTDIR)\hud_update.obj"
	-@erase "$(INTDIR)\menu.obj"
	-@erase "$(INTDIR)\message.obj"
	-@erase "$(INTDIR)\MOTD.obj"
	-@erase "$(INTDIR)\parsemsg.obj"
	-@erase "$(INTDIR)\saytext.obj"
	-@erase "$(INTDIR)\scoreboard.obj"
	-@erase "$(INTDIR)\status_icons.obj"
	-@erase "$(INTDIR)\statusbar.obj"
	-@erase "$(INTDIR)\text_message.obj"
	-@erase "$(INTDIR)\train.obj"
	-@erase "$(INTDIR)\util.obj"
	-@erase "$(INTDIR)\vc60.pdb"
	-@erase "$(OUTDIR)\client.dll"
	-@erase "$(OUTDIR)\client.exp"
	-@erase "$(OUTDIR)\client.lib"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

CPP=shcl.exe
CPP_PROJ=/nologo /MC /W3 /Zi /Ox /D _WIN32_WCE=$(CEVersion) /D "$(CEConfigName)" /D "NDEBUG" /D "SHx" /D "SH4" /D "_SH4_" /D UNDER_CE=$(CEVersion) /D "UNICODE" /D "_MBCS" /D "_USRDLL" /D "_UNICODE" /Fp"$(INTDIR)\client.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /Qsh4r7 /Qs /Qfast /Qgvp /c 

.c{$(INTDIR)}.obj::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

.cpp{$(INTDIR)}.obj::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

.cxx{$(INTDIR)}.obj::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

.c{$(INTDIR)}.sbr::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

.cpp{$(INTDIR)}.sbr::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

.cxx{$(INTDIR)}.sbr::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

RSC=rc.exe
MTL=midl.exe
MTL_PROJ=/nologo /D "NDEBUG" /mktyplib203 /o "NUL" /win32 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\client.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=coredll.lib /nologo /entry:"_DllMainCRTStartup" /base:"0x10000000" /align:"4096" /dll /incremental:no /pdb:"$(OUTDIR)\client.pdb" /machine:SH4 /nodefaultlib:"$(CENoDefaultLib)" /out:"$(OUTDIR)\client.dll" /implib:"$(OUTDIR)\client.lib" /subsystem:$(CESubsystem) /STACK:65536,4096 
LINK32_OBJS= \
	"$(INTDIR)\ammo.obj" \
	"$(INTDIR)\ammo_secondary.obj" \
	"$(INTDIR)\ammohistory.obj" \
	"$(INTDIR)\battery.obj" \
	"$(INTDIR)\cdll_int.obj" \
	"$(INTDIR)\death.obj" \
	"$(INTDIR)\flashlight.obj" \
	"$(INTDIR)\geiger.obj" \
	"$(INTDIR)\health.obj" \
	"$(INTDIR)\hud.obj" \
	"$(INTDIR)\hud_msg.obj" \
	"$(INTDIR)\hud_redraw.obj" \
	"$(INTDIR)\hud_update.obj" \
	"$(INTDIR)\menu.obj" \
	"$(INTDIR)\message.obj" \
	"$(INTDIR)\MOTD.obj" \
	"$(INTDIR)\parsemsg.obj" \
	"$(INTDIR)\saytext.obj" \
	"$(INTDIR)\scoreboard.obj" \
	"$(INTDIR)\status_icons.obj" \
	"$(INTDIR)\statusbar.obj" \
	"$(INTDIR)\text_message.obj" \
	"$(INTDIR)\train.obj" \
	"$(INTDIR)\util.obj"

"$(OUTDIR)\client.dll" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "client - Win32 (WCE SH4) Debug"

OUTDIR=.\WCESH4Dbg
INTDIR=.\WCESH4Dbg
# Begin Custom Macros
OutDir=.\WCESH4Dbg
# End Custom Macros

ALL : "$(OUTDIR)\client.dll"


CLEAN :
	-@erase "$(INTDIR)\ammo.obj"
	-@erase "$(INTDIR)\ammo_secondary.obj"
	-@erase "$(INTDIR)\ammohistory.obj"
	-@erase "$(INTDIR)\battery.obj"
	-@erase "$(INTDIR)\cdll_int.obj"
	-@erase "$(INTDIR)\death.obj"
	-@erase "$(INTDIR)\flashlight.obj"
	-@erase "$(INTDIR)\geiger.obj"
	-@erase "$(INTDIR)\health.obj"
	-@erase "$(INTDIR)\hud.obj"
	-@erase "$(INTDIR)\hud_msg.obj"
	-@erase "$(INTDIR)\hud_redraw.obj"
	-@erase "$(INTDIR)\hud_update.obj"
	-@erase "$(INTDIR)\menu.obj"
	-@erase "$(INTDIR)\message.obj"
	-@erase "$(INTDIR)\MOTD.obj"
	-@erase "$(INTDIR)\parsemsg.obj"
	-@erase "$(INTDIR)\saytext.obj"
	-@erase "$(INTDIR)\scoreboard.obj"
	-@erase "$(INTDIR)\status_icons.obj"
	-@erase "$(INTDIR)\statusbar.obj"
	-@erase "$(INTDIR)\text_message.obj"
	-@erase "$(INTDIR)\train.obj"
	-@erase "$(INTDIR)\util.obj"
	-@erase "$(INTDIR)\vc60.pdb"
	-@erase "$(OUTDIR)\client.dll"
	-@erase "$(OUTDIR)\client.exp"
	-@erase "$(OUTDIR)\client.ilk"
	-@erase "$(OUTDIR)\client.lib"
	-@erase "$(OUTDIR)\client.pdb"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

CPP=shcl.exe
CPP_PROJ=/nologo /MC /W3 /Zi /Od /D _WIN32_WCE=$(CEVersion) /D "$(CEConfigName)" /D "DEBUG" /D "SHx" /D "SH4" /D "_SH4_" /D UNDER_CE=$(CEVersion) /D "UNICODE" /D "_MBCS" /D "_USRDLL" /D "_UNICODE" /Fp"$(INTDIR)\client.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /Qsh4r7 /Qs /Qfast /c 

.c{$(INTDIR)}.obj::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

.cpp{$(INTDIR)}.obj::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

.cxx{$(INTDIR)}.obj::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

.c{$(INTDIR)}.sbr::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

.cpp{$(INTDIR)}.sbr::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

.cxx{$(INTDIR)}.sbr::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

RSC=rc.exe
MTL=midl.exe
MTL_PROJ=/nologo /D "_DEBUG" /mktyplib203 /o "NUL" /win32 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\client.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=coredll.lib /nologo /entry:"_DllMainCRTStartup" /base:"0x10000000" /align:"4096" /dll /incremental:yes /pdb:"$(OUTDIR)\client.pdb" /debug /machine:SH4 /nodefaultlib:"$(CENoDefaultLib)" /out:"$(OUTDIR)\client.dll" /implib:"$(OUTDIR)\client.lib" /subsystem:$(CESubsystem) /STACK:65536,4096 
LINK32_OBJS= \
	"$(INTDIR)\ammo.obj" \
	"$(INTDIR)\ammo_secondary.obj" \
	"$(INTDIR)\ammohistory.obj" \
	"$(INTDIR)\battery.obj" \
	"$(INTDIR)\cdll_int.obj" \
	"$(INTDIR)\death.obj" \
	"$(INTDIR)\flashlight.obj" \
	"$(INTDIR)\geiger.obj" \
	"$(INTDIR)\health.obj" \
	"$(INTDIR)\hud.obj" \
	"$(INTDIR)\hud_msg.obj" \
	"$(INTDIR)\hud_redraw.obj" \
	"$(INTDIR)\hud_update.obj" \
	"$(INTDIR)\menu.obj" \
	"$(INTDIR)\message.obj" \
	"$(INTDIR)\MOTD.obj" \
	"$(INTDIR)\parsemsg.obj" \
	"$(INTDIR)\saytext.obj" \
	"$(INTDIR)\scoreboard.obj" \
	"$(INTDIR)\status_icons.obj" \
	"$(INTDIR)\statusbar.obj" \
	"$(INTDIR)\text_message.obj" \
	"$(INTDIR)\train.obj" \
	"$(INTDIR)\util.obj"

"$(OUTDIR)\client.dll" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ENDIF 


!IF "$(NO_EXTERNAL_DEPS)" != "1"
!IF EXISTS("client.dep")
!INCLUDE "client.dep"
!ELSE 
!MESSAGE Warning: cannot find "client.dep"
!ENDIF 
!ENDIF 


!IF "$(CFG)" == "client - Win32 (WCE SH4) Release" || "$(CFG)" == "client - Win32 (WCE SH4) Debug"
SOURCE=..\ammo.cpp

"$(INTDIR)\ammo.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=..\ammo_secondary.cpp

"$(INTDIR)\ammo_secondary.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=..\ammohistory.cpp

"$(INTDIR)\ammohistory.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=..\battery.cpp

"$(INTDIR)\battery.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=..\cdll_int.cpp

"$(INTDIR)\cdll_int.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=..\death.cpp

"$(INTDIR)\death.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=..\flashlight.cpp

"$(INTDIR)\flashlight.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=..\geiger.cpp

"$(INTDIR)\geiger.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=..\health.cpp

"$(INTDIR)\health.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=..\hud.cpp

"$(INTDIR)\hud.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=..\hud_msg.cpp

"$(INTDIR)\hud_msg.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=..\hud_redraw.cpp

"$(INTDIR)\hud_redraw.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=..\hud_update.cpp

"$(INTDIR)\hud_update.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=..\menu.cpp

"$(INTDIR)\menu.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=..\message.cpp

"$(INTDIR)\message.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=..\MOTD.cpp

"$(INTDIR)\MOTD.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=..\parsemsg.cpp

"$(INTDIR)\parsemsg.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=..\saytext.cpp

"$(INTDIR)\saytext.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=..\scoreboard.cpp

"$(INTDIR)\scoreboard.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=..\status_icons.cpp

"$(INTDIR)\status_icons.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=..\statusbar.cpp

"$(INTDIR)\statusbar.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=..\text_message.cpp

"$(INTDIR)\text_message.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=..\train.cpp

"$(INTDIR)\train.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=..\util.cpp

"$(INTDIR)\util.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)



!ENDIF 

