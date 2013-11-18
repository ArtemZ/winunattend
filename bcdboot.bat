@echo off
set disk="f"
set oscommand="Bcdedit -store %disk%:\boot\bcd /create /d 'WINPE' /application osloader"
del %disk%:\boot\BCD
Bcdedit -createstore %disk%:\boot\BCD
Bcdedit -store %disk%:\boot\BCD -create {bootmgr} /d "Boot Manager"
Bcdedit -store %disk%:\boot\BCD -set {bootmgr} device boot
for /f "tokens=2 delims={}" %%g in ('Bcdedit -store f:\boot\bcd /create /d "WINPE" /application osloader') do (set guid={%%g})
rem echo %guid%

Bcdedit -store %disk%:\boot\BCD -set %guid% osdevice partition=%disk%:
Bcdedit -store %disk%:\boot\BCD -set %guid% device partition=%disk%:
Bcdedit -store %disk%:\boot\BCD -set %guid% path \windows\system32\boot\winload.exe

Bcdedit -store %disk%:\boot\BCD -set %guid% systemroot \windows

Bcdedit -store %disk%:\boot\BCD -set %guid% winpe yes
Bcdedit -store %disk%:\boot\BCD -set %guid% detecthal yes

Bcdedit -store %disk%:\boot\BCD -displayorder %guid% -addlast