REG add HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\System /v DisableTaskMgr /t REG_DWORD /d 0 /f
REG add HKLM\Software\Microsoft\Windows NT\CurrentVersion\IniFileMapping\system.ini\boot /v Shell /t REG_SZ /d "SYS:Microsoft\Windows NT\CurrentVersion\Winlogon" /f
REG delete HKCU\Software\Microsoft\Windows NT\CurrentVersion\Winlogon /v Shell
