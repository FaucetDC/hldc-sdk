# Microsoft Developer Studio Generated NMAKE File, Based on hl.dsp
!IF "$(CFG)" == ""
CFG=hl - Win32 (WCE SH4) Debug
!MESSAGE No configuration specified. Defaulting to hl - Win32 (WCE SH4) Debug.
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

!IF "$(CFG)" != "hl - Win32 (WCE SH4) Release" && "$(CFG)" != "hl - Win32 (WCE SH4) Debug"
!MESSAGE Invalid configuration "$(CFG)" specified.
!MESSAGE You can specify a configuration when running NMAKE
!MESSAGE by defining the macro CFG on the command line. For example:
!MESSAGE 
!MESSAGE NMAKE /f "hl.mak" CFG="hl - Win32 (WCE SH4) Debug"
!MESSAGE 
!MESSAGE Possible choices for configuration are:
!MESSAGE 
!MESSAGE "hl - Win32 (WCE SH4) Release" (based on "Win32 (WCE SH4) Dynamic-Link Library")
!MESSAGE "hl - Win32 (WCE SH4) Debug" (based on "Win32 (WCE SH4) Dynamic-Link Library")
!MESSAGE 
!ERROR An invalid configuration is specified.
!ENDIF 

!IF "$(OS)" == "Windows_NT"
NULL=
!ELSE 
NULL=nul
!ENDIF 

!IF  "$(CFG)" == "hl - Win32 (WCE SH4) Release"

OUTDIR=.\WCESH4Rel
INTDIR=.\WCESH4Rel
# Begin Custom Macros
OutDir=.\WCESH4Rel
# End Custom Macros

ALL : "$(OUTDIR)\hl.dll"


CLEAN :
	-@erase "$(INTDIR)\aflock.obj"
	-@erase "$(INTDIR)\agrunt.obj"
	-@erase "$(INTDIR)\airtank.obj"
	-@erase "$(INTDIR)\animating.obj"
	-@erase "$(INTDIR)\animation.obj"
	-@erase "$(INTDIR)\apache.obj"
	-@erase "$(INTDIR)\barnacle.obj"
	-@erase "$(INTDIR)\barney.obj"
	-@erase "$(INTDIR)\bigmomma.obj"
	-@erase "$(INTDIR)\bloater.obj"
	-@erase "$(INTDIR)\bmodels.obj"
	-@erase "$(INTDIR)\bullsquid.obj"
	-@erase "$(INTDIR)\buttons.obj"
	-@erase "$(INTDIR)\cbase.obj"
	-@erase "$(INTDIR)\client.obj"
	-@erase "$(INTDIR)\combat.obj"
	-@erase "$(INTDIR)\controller.obj"
	-@erase "$(INTDIR)\crossbow.obj"
	-@erase "$(INTDIR)\crowbar.obj"
	-@erase "$(INTDIR)\defaultai.obj"
	-@erase "$(INTDIR)\doors.obj"
	-@erase "$(INTDIR)\effects.obj"
	-@erase "$(INTDIR)\egon.obj"
	-@erase "$(INTDIR)\explode.obj"
	-@erase "$(INTDIR)\flyingmonster.obj"
	-@erase "$(INTDIR)\func_break.obj"
	-@erase "$(INTDIR)\func_tank.obj"
	-@erase "$(INTDIR)\game.obj"
	-@erase "$(INTDIR)\gamerules.obj"
	-@erase "$(INTDIR)\gargantua.obj"
	-@erase "$(INTDIR)\gauss.obj"
	-@erase "$(INTDIR)\genericmonster.obj"
	-@erase "$(INTDIR)\ggrenade.obj"
	-@erase "$(INTDIR)\globals.obj"
	-@erase "$(INTDIR)\glock.obj"
	-@erase "$(INTDIR)\gman.obj"
	-@erase "$(INTDIR)\h_ai.obj"
	-@erase "$(INTDIR)\h_battery.obj"
	-@erase "$(INTDIR)\h_cine.obj"
	-@erase "$(INTDIR)\h_cycler.obj"
	-@erase "$(INTDIR)\h_export.obj"
	-@erase "$(INTDIR)\handgrenade.obj"
	-@erase "$(INTDIR)\hassassin.obj"
	-@erase "$(INTDIR)\headcrab.obj"
	-@erase "$(INTDIR)\healthkit.obj"
	-@erase "$(INTDIR)\hgrunt.obj"
	-@erase "$(INTDIR)\hornet.obj"
	-@erase "$(INTDIR)\hornetgun.obj"
	-@erase "$(INTDIR)\houndeye.obj"
	-@erase "$(INTDIR)\ichthyosaur.obj"
	-@erase "$(INTDIR)\islave.obj"
	-@erase "$(INTDIR)\items.obj"
	-@erase "$(INTDIR)\leech.obj"
	-@erase "$(INTDIR)\lights.obj"
	-@erase "$(INTDIR)\maprules.obj"
	-@erase "$(INTDIR)\monstermaker.obj"
	-@erase "$(INTDIR)\monsters.obj"
	-@erase "$(INTDIR)\monsterstate.obj"
	-@erase "$(INTDIR)\mortar.obj"
	-@erase "$(INTDIR)\mp5.obj"
	-@erase "$(INTDIR)\multiplay_gamerules.obj"
	-@erase "$(INTDIR)\nihilanth.obj"
	-@erase "$(INTDIR)\nodes.obj"
	-@erase "$(INTDIR)\osprey.obj"
	-@erase "$(INTDIR)\pathcorner.obj"
	-@erase "$(INTDIR)\plane.obj"
	-@erase "$(INTDIR)\plats.obj"
	-@erase "$(INTDIR)\player.obj"
	-@erase "$(INTDIR)\python.obj"
	-@erase "$(INTDIR)\rat.obj"
	-@erase "$(INTDIR)\roach.obj"
	-@erase "$(INTDIR)\rpg.obj"
	-@erase "$(INTDIR)\satchel.obj"
	-@erase "$(INTDIR)\schedule.obj"
	-@erase "$(INTDIR)\scientist.obj"
	-@erase "$(INTDIR)\scripted.obj"
	-@erase "$(INTDIR)\shotgun.obj"
	-@erase "$(INTDIR)\singleplay_gamerules.obj"
	-@erase "$(INTDIR)\skill.obj"
	-@erase "$(INTDIR)\sound.obj"
	-@erase "$(INTDIR)\soundent.obj"
	-@erase "$(INTDIR)\spectator.obj"
	-@erase "$(INTDIR)\squadmonster.obj"
	-@erase "$(INTDIR)\squeakgrenade.obj"
	-@erase "$(INTDIR)\subs.obj"
	-@erase "$(INTDIR)\talkmonster.obj"
	-@erase "$(INTDIR)\teamplay_gamerules.obj"
	-@erase "$(INTDIR)\tempmonster.obj"
	-@erase "$(INTDIR)\tentacle.obj"
	-@erase "$(INTDIR)\triggers.obj"
	-@erase "$(INTDIR)\tripmine.obj"
	-@erase "$(INTDIR)\turret.obj"
	-@erase "$(INTDIR)\util.obj"
	-@erase "$(INTDIR)\vc60.pdb"
	-@erase "$(INTDIR)\weapons.obj"
	-@erase "$(INTDIR)\world.obj"
	-@erase "$(INTDIR)\xen.obj"
	-@erase "$(INTDIR)\zombie.obj"
	-@erase "$(OUTDIR)\hl.dll"
	-@erase "$(OUTDIR)\hl.exp"
	-@erase "$(OUTDIR)\hl.lib"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

CPP=shcl.exe
CPP_PROJ=/nologo /MC /W3 /Zi /Ox /D _WIN32_WCE=$(CEVersion) /D "$(CEConfigName)" /D "NDEBUG" /D "SHx" /D "SH4" /D "_SH4_" /D UNDER_CE=$(CEVersion) /D "UNICODE" /D "_MBCS" /D "_USRDLL" /D "_UNICODE" /Fp"$(INTDIR)\hl.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /Qsh4r7 /Qs /Qfast /Qgvp /c 

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
BSC32_FLAGS=/nologo /o"$(OUTDIR)\hl.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=coredll.lib /nologo /entry:"_DllMainCRTStartup" /base:"0x10000000" /align:"4096" /dll /incremental:no /pdb:"$(OUTDIR)\hl.pdb" /machine:SH4 /nodefaultlib:"$(CENoDefaultLib)" /out:"$(OUTDIR)\hl.dll" /implib:"$(OUTDIR)\hl.lib" /subsystem:$(CESubsystem) /STACK:65536,4096 
LINK32_OBJS= \
	"$(INTDIR)\aflock.obj" \
	"$(INTDIR)\agrunt.obj" \
	"$(INTDIR)\airtank.obj" \
	"$(INTDIR)\animating.obj" \
	"$(INTDIR)\animation.obj" \
	"$(INTDIR)\apache.obj" \
	"$(INTDIR)\barnacle.obj" \
	"$(INTDIR)\barney.obj" \
	"$(INTDIR)\bigmomma.obj" \
	"$(INTDIR)\bloater.obj" \
	"$(INTDIR)\bmodels.obj" \
	"$(INTDIR)\bullsquid.obj" \
	"$(INTDIR)\buttons.obj" \
	"$(INTDIR)\cbase.obj" \
	"$(INTDIR)\client.obj" \
	"$(INTDIR)\combat.obj" \
	"$(INTDIR)\controller.obj" \
	"$(INTDIR)\crossbow.obj" \
	"$(INTDIR)\crowbar.obj" \
	"$(INTDIR)\defaultai.obj" \
	"$(INTDIR)\doors.obj" \
	"$(INTDIR)\effects.obj" \
	"$(INTDIR)\egon.obj" \
	"$(INTDIR)\explode.obj" \
	"$(INTDIR)\flyingmonster.obj" \
	"$(INTDIR)\func_break.obj" \
	"$(INTDIR)\func_tank.obj" \
	"$(INTDIR)\game.obj" \
	"$(INTDIR)\gamerules.obj" \
	"$(INTDIR)\gargantua.obj" \
	"$(INTDIR)\gauss.obj" \
	"$(INTDIR)\genericmonster.obj" \
	"$(INTDIR)\ggrenade.obj" \
	"$(INTDIR)\globals.obj" \
	"$(INTDIR)\glock.obj" \
	"$(INTDIR)\gman.obj" \
	"$(INTDIR)\h_ai.obj" \
	"$(INTDIR)\h_battery.obj" \
	"$(INTDIR)\h_cine.obj" \
	"$(INTDIR)\h_cycler.obj" \
	"$(INTDIR)\h_export.obj" \
	"$(INTDIR)\handgrenade.obj" \
	"$(INTDIR)\hassassin.obj" \
	"$(INTDIR)\headcrab.obj" \
	"$(INTDIR)\healthkit.obj" \
	"$(INTDIR)\hgrunt.obj" \
	"$(INTDIR)\hornet.obj" \
	"$(INTDIR)\hornetgun.obj" \
	"$(INTDIR)\houndeye.obj" \
	"$(INTDIR)\ichthyosaur.obj" \
	"$(INTDIR)\islave.obj" \
	"$(INTDIR)\items.obj" \
	"$(INTDIR)\leech.obj" \
	"$(INTDIR)\lights.obj" \
	"$(INTDIR)\maprules.obj" \
	"$(INTDIR)\monstermaker.obj" \
	"$(INTDIR)\monsters.obj" \
	"$(INTDIR)\monsterstate.obj" \
	"$(INTDIR)\mortar.obj" \
	"$(INTDIR)\mp5.obj" \
	"$(INTDIR)\multiplay_gamerules.obj" \
	"$(INTDIR)\nihilanth.obj" \
	"$(INTDIR)\nodes.obj" \
	"$(INTDIR)\osprey.obj" \
	"$(INTDIR)\pathcorner.obj" \
	"$(INTDIR)\plane.obj" \
	"$(INTDIR)\plats.obj" \
	"$(INTDIR)\player.obj" \
	"$(INTDIR)\python.obj" \
	"$(INTDIR)\rat.obj" \
	"$(INTDIR)\roach.obj" \
	"$(INTDIR)\rpg.obj" \
	"$(INTDIR)\satchel.obj" \
	"$(INTDIR)\schedule.obj" \
	"$(INTDIR)\scientist.obj" \
	"$(INTDIR)\scripted.obj" \
	"$(INTDIR)\shotgun.obj" \
	"$(INTDIR)\singleplay_gamerules.obj" \
	"$(INTDIR)\skill.obj" \
	"$(INTDIR)\sound.obj" \
	"$(INTDIR)\soundent.obj" \
	"$(INTDIR)\spectator.obj" \
	"$(INTDIR)\squadmonster.obj" \
	"$(INTDIR)\squeakgrenade.obj" \
	"$(INTDIR)\subs.obj" \
	"$(INTDIR)\talkmonster.obj" \
	"$(INTDIR)\teamplay_gamerules.obj" \
	"$(INTDIR)\tempmonster.obj" \
	"$(INTDIR)\tentacle.obj" \
	"$(INTDIR)\triggers.obj" \
	"$(INTDIR)\tripmine.obj" \
	"$(INTDIR)\turret.obj" \
	"$(INTDIR)\util.obj" \
	"$(INTDIR)\weapons.obj" \
	"$(INTDIR)\world.obj" \
	"$(INTDIR)\xen.obj" \
	"$(INTDIR)\zombie.obj"

"$(OUTDIR)\hl.dll" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "hl - Win32 (WCE SH4) Debug"

OUTDIR=.\WCESH4Dbg
INTDIR=.\WCESH4Dbg
# Begin Custom Macros
OutDir=.\WCESH4Dbg
# End Custom Macros

ALL : "$(OUTDIR)\hl.dll"


CLEAN :
	-@erase "$(INTDIR)\aflock.obj"
	-@erase "$(INTDIR)\agrunt.obj"
	-@erase "$(INTDIR)\airtank.obj"
	-@erase "$(INTDIR)\animating.obj"
	-@erase "$(INTDIR)\animation.obj"
	-@erase "$(INTDIR)\apache.obj"
	-@erase "$(INTDIR)\barnacle.obj"
	-@erase "$(INTDIR)\barney.obj"
	-@erase "$(INTDIR)\bigmomma.obj"
	-@erase "$(INTDIR)\bloater.obj"
	-@erase "$(INTDIR)\bmodels.obj"
	-@erase "$(INTDIR)\bullsquid.obj"
	-@erase "$(INTDIR)\buttons.obj"
	-@erase "$(INTDIR)\cbase.obj"
	-@erase "$(INTDIR)\client.obj"
	-@erase "$(INTDIR)\combat.obj"
	-@erase "$(INTDIR)\controller.obj"
	-@erase "$(INTDIR)\crossbow.obj"
	-@erase "$(INTDIR)\crowbar.obj"
	-@erase "$(INTDIR)\defaultai.obj"
	-@erase "$(INTDIR)\doors.obj"
	-@erase "$(INTDIR)\effects.obj"
	-@erase "$(INTDIR)\egon.obj"
	-@erase "$(INTDIR)\explode.obj"
	-@erase "$(INTDIR)\flyingmonster.obj"
	-@erase "$(INTDIR)\func_break.obj"
	-@erase "$(INTDIR)\func_tank.obj"
	-@erase "$(INTDIR)\game.obj"
	-@erase "$(INTDIR)\gamerules.obj"
	-@erase "$(INTDIR)\gargantua.obj"
	-@erase "$(INTDIR)\gauss.obj"
	-@erase "$(INTDIR)\genericmonster.obj"
	-@erase "$(INTDIR)\ggrenade.obj"
	-@erase "$(INTDIR)\globals.obj"
	-@erase "$(INTDIR)\glock.obj"
	-@erase "$(INTDIR)\gman.obj"
	-@erase "$(INTDIR)\h_ai.obj"
	-@erase "$(INTDIR)\h_battery.obj"
	-@erase "$(INTDIR)\h_cine.obj"
	-@erase "$(INTDIR)\h_cycler.obj"
	-@erase "$(INTDIR)\h_export.obj"
	-@erase "$(INTDIR)\handgrenade.obj"
	-@erase "$(INTDIR)\hassassin.obj"
	-@erase "$(INTDIR)\headcrab.obj"
	-@erase "$(INTDIR)\healthkit.obj"
	-@erase "$(INTDIR)\hgrunt.obj"
	-@erase "$(INTDIR)\hornet.obj"
	-@erase "$(INTDIR)\hornetgun.obj"
	-@erase "$(INTDIR)\houndeye.obj"
	-@erase "$(INTDIR)\ichthyosaur.obj"
	-@erase "$(INTDIR)\islave.obj"
	-@erase "$(INTDIR)\items.obj"
	-@erase "$(INTDIR)\leech.obj"
	-@erase "$(INTDIR)\lights.obj"
	-@erase "$(INTDIR)\maprules.obj"
	-@erase "$(INTDIR)\monstermaker.obj"
	-@erase "$(INTDIR)\monsters.obj"
	-@erase "$(INTDIR)\monsterstate.obj"
	-@erase "$(INTDIR)\mortar.obj"
	-@erase "$(INTDIR)\mp5.obj"
	-@erase "$(INTDIR)\multiplay_gamerules.obj"
	-@erase "$(INTDIR)\nihilanth.obj"
	-@erase "$(INTDIR)\nodes.obj"
	-@erase "$(INTDIR)\osprey.obj"
	-@erase "$(INTDIR)\pathcorner.obj"
	-@erase "$(INTDIR)\plane.obj"
	-@erase "$(INTDIR)\plats.obj"
	-@erase "$(INTDIR)\player.obj"
	-@erase "$(INTDIR)\python.obj"
	-@erase "$(INTDIR)\rat.obj"
	-@erase "$(INTDIR)\roach.obj"
	-@erase "$(INTDIR)\rpg.obj"
	-@erase "$(INTDIR)\satchel.obj"
	-@erase "$(INTDIR)\schedule.obj"
	-@erase "$(INTDIR)\scientist.obj"
	-@erase "$(INTDIR)\scripted.obj"
	-@erase "$(INTDIR)\shotgun.obj"
	-@erase "$(INTDIR)\singleplay_gamerules.obj"
	-@erase "$(INTDIR)\skill.obj"
	-@erase "$(INTDIR)\sound.obj"
	-@erase "$(INTDIR)\soundent.obj"
	-@erase "$(INTDIR)\spectator.obj"
	-@erase "$(INTDIR)\squadmonster.obj"
	-@erase "$(INTDIR)\squeakgrenade.obj"
	-@erase "$(INTDIR)\subs.obj"
	-@erase "$(INTDIR)\talkmonster.obj"
	-@erase "$(INTDIR)\teamplay_gamerules.obj"
	-@erase "$(INTDIR)\tempmonster.obj"
	-@erase "$(INTDIR)\tentacle.obj"
	-@erase "$(INTDIR)\triggers.obj"
	-@erase "$(INTDIR)\tripmine.obj"
	-@erase "$(INTDIR)\turret.obj"
	-@erase "$(INTDIR)\util.obj"
	-@erase "$(INTDIR)\vc60.pdb"
	-@erase "$(INTDIR)\weapons.obj"
	-@erase "$(INTDIR)\world.obj"
	-@erase "$(INTDIR)\xen.obj"
	-@erase "$(INTDIR)\zombie.obj"
	-@erase "$(OUTDIR)\hl.dll"
	-@erase "$(OUTDIR)\hl.exp"
	-@erase "$(OUTDIR)\hl.ilk"
	-@erase "$(OUTDIR)\hl.lib"
	-@erase "$(OUTDIR)\hl.pdb"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

CPP=shcl.exe
CPP_PROJ=/nologo /MC /W3 /Zi /Od /D _WIN32_WCE=$(CEVersion) /D "$(CEConfigName)" /D "DEBUG" /D "SHx" /D "SH4" /D "_SH4_" /D UNDER_CE=$(CEVersion) /D "UNICODE" /D "_MBCS" /D "_USRDLL" /D "_UNICODE" /Fp"$(INTDIR)\hl.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /Qsh4r7 /Qs /Qfast /c 

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
BSC32_FLAGS=/nologo /o"$(OUTDIR)\hl.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=coredll.lib /nologo /entry:"_DllMainCRTStartup" /base:"0x10000000" /align:"4096" /dll /incremental:yes /pdb:"$(OUTDIR)\hl.pdb" /debug /machine:SH4 /nodefaultlib:"$(CENoDefaultLib)" /out:"$(OUTDIR)\hl.dll" /implib:"$(OUTDIR)\hl.lib" /subsystem:$(CESubsystem) /STACK:65536,4096 
LINK32_OBJS= \
	"$(INTDIR)\aflock.obj" \
	"$(INTDIR)\agrunt.obj" \
	"$(INTDIR)\airtank.obj" \
	"$(INTDIR)\animating.obj" \
	"$(INTDIR)\animation.obj" \
	"$(INTDIR)\apache.obj" \
	"$(INTDIR)\barnacle.obj" \
	"$(INTDIR)\barney.obj" \
	"$(INTDIR)\bigmomma.obj" \
	"$(INTDIR)\bloater.obj" \
	"$(INTDIR)\bmodels.obj" \
	"$(INTDIR)\bullsquid.obj" \
	"$(INTDIR)\buttons.obj" \
	"$(INTDIR)\cbase.obj" \
	"$(INTDIR)\client.obj" \
	"$(INTDIR)\combat.obj" \
	"$(INTDIR)\controller.obj" \
	"$(INTDIR)\crossbow.obj" \
	"$(INTDIR)\crowbar.obj" \
	"$(INTDIR)\defaultai.obj" \
	"$(INTDIR)\doors.obj" \
	"$(INTDIR)\effects.obj" \
	"$(INTDIR)\egon.obj" \
	"$(INTDIR)\explode.obj" \
	"$(INTDIR)\flyingmonster.obj" \
	"$(INTDIR)\func_break.obj" \
	"$(INTDIR)\func_tank.obj" \
	"$(INTDIR)\game.obj" \
	"$(INTDIR)\gamerules.obj" \
	"$(INTDIR)\gargantua.obj" \
	"$(INTDIR)\gauss.obj" \
	"$(INTDIR)\genericmonster.obj" \
	"$(INTDIR)\ggrenade.obj" \
	"$(INTDIR)\globals.obj" \
	"$(INTDIR)\glock.obj" \
	"$(INTDIR)\gman.obj" \
	"$(INTDIR)\h_ai.obj" \
	"$(INTDIR)\h_battery.obj" \
	"$(INTDIR)\h_cine.obj" \
	"$(INTDIR)\h_cycler.obj" \
	"$(INTDIR)\h_export.obj" \
	"$(INTDIR)\handgrenade.obj" \
	"$(INTDIR)\hassassin.obj" \
	"$(INTDIR)\headcrab.obj" \
	"$(INTDIR)\healthkit.obj" \
	"$(INTDIR)\hgrunt.obj" \
	"$(INTDIR)\hornet.obj" \
	"$(INTDIR)\hornetgun.obj" \
	"$(INTDIR)\houndeye.obj" \
	"$(INTDIR)\ichthyosaur.obj" \
	"$(INTDIR)\islave.obj" \
	"$(INTDIR)\items.obj" \
	"$(INTDIR)\leech.obj" \
	"$(INTDIR)\lights.obj" \
	"$(INTDIR)\maprules.obj" \
	"$(INTDIR)\monstermaker.obj" \
	"$(INTDIR)\monsters.obj" \
	"$(INTDIR)\monsterstate.obj" \
	"$(INTDIR)\mortar.obj" \
	"$(INTDIR)\mp5.obj" \
	"$(INTDIR)\multiplay_gamerules.obj" \
	"$(INTDIR)\nihilanth.obj" \
	"$(INTDIR)\nodes.obj" \
	"$(INTDIR)\osprey.obj" \
	"$(INTDIR)\pathcorner.obj" \
	"$(INTDIR)\plane.obj" \
	"$(INTDIR)\plats.obj" \
	"$(INTDIR)\player.obj" \
	"$(INTDIR)\python.obj" \
	"$(INTDIR)\rat.obj" \
	"$(INTDIR)\roach.obj" \
	"$(INTDIR)\rpg.obj" \
	"$(INTDIR)\satchel.obj" \
	"$(INTDIR)\schedule.obj" \
	"$(INTDIR)\scientist.obj" \
	"$(INTDIR)\scripted.obj" \
	"$(INTDIR)\shotgun.obj" \
	"$(INTDIR)\singleplay_gamerules.obj" \
	"$(INTDIR)\skill.obj" \
	"$(INTDIR)\sound.obj" \
	"$(INTDIR)\soundent.obj" \
	"$(INTDIR)\spectator.obj" \
	"$(INTDIR)\squadmonster.obj" \
	"$(INTDIR)\squeakgrenade.obj" \
	"$(INTDIR)\subs.obj" \
	"$(INTDIR)\talkmonster.obj" \
	"$(INTDIR)\teamplay_gamerules.obj" \
	"$(INTDIR)\tempmonster.obj" \
	"$(INTDIR)\tentacle.obj" \
	"$(INTDIR)\triggers.obj" \
	"$(INTDIR)\tripmine.obj" \
	"$(INTDIR)\turret.obj" \
	"$(INTDIR)\util.obj" \
	"$(INTDIR)\weapons.obj" \
	"$(INTDIR)\world.obj" \
	"$(INTDIR)\xen.obj" \
	"$(INTDIR)\zombie.obj"

"$(OUTDIR)\hl.dll" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ENDIF 


!IF "$(NO_EXTERNAL_DEPS)" != "1"
!IF EXISTS("hl.dep")
!INCLUDE "hl.dep"
!ELSE 
!MESSAGE Warning: cannot find "hl.dep"
!ENDIF 
!ENDIF 


!IF "$(CFG)" == "hl - Win32 (WCE SH4) Release" || "$(CFG)" == "hl - Win32 (WCE SH4) Debug"
SOURCE=..\aflock.cpp

"$(INTDIR)\aflock.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=..\agrunt.cpp

"$(INTDIR)\agrunt.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=..\airtank.cpp

"$(INTDIR)\airtank.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=..\animating.cpp

"$(INTDIR)\animating.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=..\animation.cpp

"$(INTDIR)\animation.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=..\apache.cpp

"$(INTDIR)\apache.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=..\barnacle.cpp

"$(INTDIR)\barnacle.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=..\barney.cpp

"$(INTDIR)\barney.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=..\bigmomma.cpp

"$(INTDIR)\bigmomma.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=..\bloater.cpp

"$(INTDIR)\bloater.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=..\bmodels.cpp

"$(INTDIR)\bmodels.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=..\bullsquid.cpp

"$(INTDIR)\bullsquid.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=..\buttons.cpp

"$(INTDIR)\buttons.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=..\cbase.cpp

"$(INTDIR)\cbase.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=..\client.cpp

"$(INTDIR)\client.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=..\combat.cpp

"$(INTDIR)\combat.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=..\controller.cpp

"$(INTDIR)\controller.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=..\crossbow.cpp

"$(INTDIR)\crossbow.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=..\crowbar.cpp

"$(INTDIR)\crowbar.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=..\defaultai.cpp

"$(INTDIR)\defaultai.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=..\doors.cpp

"$(INTDIR)\doors.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=..\effects.cpp

"$(INTDIR)\effects.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=..\egon.cpp

"$(INTDIR)\egon.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=..\explode.cpp

"$(INTDIR)\explode.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=..\flyingmonster.cpp

"$(INTDIR)\flyingmonster.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=..\func_break.cpp

"$(INTDIR)\func_break.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=..\func_tank.cpp

"$(INTDIR)\func_tank.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=..\game.cpp

"$(INTDIR)\game.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=..\gamerules.cpp

"$(INTDIR)\gamerules.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=..\gargantua.cpp

"$(INTDIR)\gargantua.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=..\gauss.cpp

"$(INTDIR)\gauss.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=..\genericmonster.cpp

"$(INTDIR)\genericmonster.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=..\ggrenade.cpp

"$(INTDIR)\ggrenade.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=..\globals.cpp

"$(INTDIR)\globals.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=..\glock.cpp

"$(INTDIR)\glock.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=..\gman.cpp

"$(INTDIR)\gman.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=..\h_ai.cpp

"$(INTDIR)\h_ai.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=..\h_battery.cpp

"$(INTDIR)\h_battery.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=..\h_cine.cpp

"$(INTDIR)\h_cine.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=..\h_cycler.cpp

"$(INTDIR)\h_cycler.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=..\h_export.cpp

"$(INTDIR)\h_export.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=..\handgrenade.cpp

"$(INTDIR)\handgrenade.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=..\hassassin.cpp

"$(INTDIR)\hassassin.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=..\headcrab.cpp

"$(INTDIR)\headcrab.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=..\healthkit.cpp

"$(INTDIR)\healthkit.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=..\hgrunt.cpp

"$(INTDIR)\hgrunt.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=..\hornet.cpp

"$(INTDIR)\hornet.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=..\hornetgun.cpp

"$(INTDIR)\hornetgun.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=..\houndeye.cpp

"$(INTDIR)\houndeye.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=..\ichthyosaur.cpp

"$(INTDIR)\ichthyosaur.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=..\islave.cpp

"$(INTDIR)\islave.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=..\items.cpp

"$(INTDIR)\items.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=..\leech.cpp

"$(INTDIR)\leech.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=..\lights.cpp

"$(INTDIR)\lights.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=..\maprules.cpp

"$(INTDIR)\maprules.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=..\monstermaker.cpp

"$(INTDIR)\monstermaker.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=..\monsters.cpp

"$(INTDIR)\monsters.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=..\monsterstate.cpp

"$(INTDIR)\monsterstate.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=..\mortar.cpp

"$(INTDIR)\mortar.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=..\mp5.cpp

"$(INTDIR)\mp5.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=..\multiplay_gamerules.cpp

"$(INTDIR)\multiplay_gamerules.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=..\nihilanth.cpp

"$(INTDIR)\nihilanth.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=..\nodes.cpp

"$(INTDIR)\nodes.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=..\osprey.cpp

"$(INTDIR)\osprey.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=..\pathcorner.cpp

"$(INTDIR)\pathcorner.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=..\plane.cpp

"$(INTDIR)\plane.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=..\plats.cpp

"$(INTDIR)\plats.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=..\player.cpp

"$(INTDIR)\player.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=..\python.cpp

"$(INTDIR)\python.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=..\rat.cpp

"$(INTDIR)\rat.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=..\roach.cpp

"$(INTDIR)\roach.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=..\rpg.cpp

"$(INTDIR)\rpg.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=..\satchel.cpp

"$(INTDIR)\satchel.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=..\schedule.cpp

"$(INTDIR)\schedule.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=..\scientist.cpp

"$(INTDIR)\scientist.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=..\scripted.cpp

"$(INTDIR)\scripted.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=..\shotgun.cpp

"$(INTDIR)\shotgun.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=..\singleplay_gamerules.cpp

"$(INTDIR)\singleplay_gamerules.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=..\skill.cpp

"$(INTDIR)\skill.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=..\sound.cpp

"$(INTDIR)\sound.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=..\soundent.cpp

"$(INTDIR)\soundent.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=..\spectator.cpp

"$(INTDIR)\spectator.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=..\squadmonster.cpp

"$(INTDIR)\squadmonster.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=..\squeakgrenade.cpp

"$(INTDIR)\squeakgrenade.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=..\subs.cpp

"$(INTDIR)\subs.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=..\talkmonster.cpp

"$(INTDIR)\talkmonster.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=..\teamplay_gamerules.cpp

"$(INTDIR)\teamplay_gamerules.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=..\tempmonster.cpp

"$(INTDIR)\tempmonster.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=..\tentacle.cpp

"$(INTDIR)\tentacle.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=..\triggers.cpp

"$(INTDIR)\triggers.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=..\tripmine.cpp

"$(INTDIR)\tripmine.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=..\turret.cpp

"$(INTDIR)\turret.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=..\util.cpp

"$(INTDIR)\util.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=..\weapons.cpp

"$(INTDIR)\weapons.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=..\world.cpp

"$(INTDIR)\world.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=..\xen.cpp

"$(INTDIR)\xen.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=..\zombie.cpp

"$(INTDIR)\zombie.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)



!ENDIF 

