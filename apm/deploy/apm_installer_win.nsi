Name "APM Planner 2"

!ifndef QTDIR
!define QTDIR "$%QTDIR%"
!endif

!ifndef QTDIR
  !error "Please define QT installation directory via /DQTDIR=C:\qt\4.8.4"
!endif

!system 'python apm_installer.py ../files apm_install.list apm_uninstall.list y'
!system 'python apm_installer.py ../qml qml_install.list qml_uninstall.list y'
!system 'python apm_installer.py ${QTDIR}\plugins qt_install.list qt_uninstall.list n'

OutFile "apmplanner2-installer-win32.exe"

InstallDir $PROGRAMFILES\APMPlanner2

Page license 
Page directory
Page components
Page instfiles
UninstPage uninstConfirm
UninstPage instfiles

LicenseData ..\license.txt

Section "APM Planner 2 files"

  SetOutPath $INSTDIR
  File ..\debug\apmplanner2.exe
  !include apm_install.list
  !include qml_install.list
  SetOutPath $INSTDIR
  File ..\libs\lib\sdl\win32\SDL.dll
  File ..\libs\thirdParty\libxbee\lib\libxbee.dll
  WriteUninstaller $INSTDIR\APMPlanner2_uninstall.exe
  SetoutPath $INSTDIR\avrdude
  File ..\avrdude\avrdude.exe
  File ..\avrdude\libusb0.dll
  File ..\avrdude\avrdude.conf

SectionEnd 

Section "Qt components"
  !include qt_install.list
  SetOutPath $INSTDIR

  File ${QTDIR}\bin\QtCore4.dll
  File ${QTDIR}\bin\QtGui4.dll
  File ${QTDIR}\bin\QtScript4.dll
  File ${QTDIR}\bin\QtMultimedia4.dll
  File ${QTDIR}\bin\QtDeclarative4.dll
  File ${QTDIR}\bin\phonon4.dll
  File ${QTDIR}\bin\QtNetwork4.dll
  File ${QTDIR}\bin\QtOpenGL4.dll
  File ${QTDIR}\bin\QtSql4.dll
  File ${QTDIR}\bin\QtSvg4.dll
  File ${QTDIR}\bin\QtTest4.dll
  File ${QTDIR}\bin\QtWebkit4.dll
  File ${QTDIR}\bin\QtXml4.dll
  File ${QTDIR}\bin\QtXmlPatterns4.dll
  File C:\Windows\system32\libeay32.dll
  File C:\Windows\system32\ssleay32.dll
SectionEnd
Section "MSVC Runtime"
  SetOutPath $INSTDIR
  File vcredist_x86.exe
  DetailPrint "Installing MSVC2012 runtime"
  ExecWait "$INSTDIR/vcredist_x86.exe /q /norestart"
SectionEnd
Section "Uninstall"
  !include apm_uninstall.list
  !include qml_install.list
  !include qt_uninstall.list
  Delete $INSTDIR\apmplanner2.exe
  Delete $INSTDIR\SDL.dll
  Delete $INSTDIR\libxbee.dll
  Delete $INSTDIR\APMPlanner2_uninstall.exe

  ;Delete $INSTDIR\*.*
  RMDir $INSTDIR
  Delete "$SMPROGRAMS\APMPlanner2\*.*"
  RMDir "$SMPROGRAMS\APMPlanner2\"
SectionEnd

Section "Create Start Menu Shortcuts"
  CreateDirectory "$SMPROGRAMS\APMPlanner2"
  CreateShortCut "$SMPROGRAMS\APMPlanner2\uninstall.lnk" "$INSTDIR\APMPlanner2_uninstall.exe" "" "$INSTDIR\APMPlanner2_uninstall.exe" 0
  CreateShortCut "$SMPROGRAMS\APMPlanner2\APMPlanner2.lnk" "$INSTDIR\apmplanner2.exe" "" "$INSTDIR\apmplanner2.exe" 0
SectionEnd
