:: The HotROM Box @ Github Releases
:: @author spamtheboss a.k.a lelufg
@echo off
title The HotROM Box @ Github Releases
ver 2.0
echo Welcome to the HotROM BOX!
@ping 127.0.0.1 -n 1 -w 1000 > nul
:menu
echo TITAN - GithubReleases | store.data
echo 1 - Flash Stock ROM
echo 2 - Flash Team Win Recovery
echo 3 - Reboot Moto G 2014
echo 4 - Reboot Moto G 2014 to Bootloader
echo 5 - Reboot Moto G 2014 to Recovery
echo 6 - About this tool
echo 7 - Exit
set /p choose=Your Command: 
if %choose%==1 goto flash_rom
if %choose%==2 goto flash_twrp
if %choose%==3 goto rom_reboot
if %choose%==4 goto adb_bootloader
if %choose%==5 goto adb_recovery
if %choose%==6 goto about_cmd
if %choose%==7 goto tool_exit
:: structure revised
:flash_rom
echo Initializing flashing method...
@ping 127.0.0.1 -n 3 -w 1000 > nul
fastboot flash partition gpt.bin
fastboot flash motoboot motoboot.img
fastboot flash logo logo.bin
fastboot flash boot boot.img
fastboot flash recovery recovery.img
fastboot flash system system.img_sparsechunk.0
fastboot flash system system.img_sparsechunk.1
fastboot flash system system.img_sparsechunk.2
fastboot flash system system.img_sparsechunk.3
fastboot flash modem NON-HLOS.bin
fastboot erase modemst1 
fastboot erase modemst2 
fastboot flash fsg fsg.mbn
fastboot erase cache 
fastboot erase userdata
echo Done!
pause
start hrb.bat
exit
:flash_twrp
echo Starting custom recovery flashing method...
@ping 127.0.0.1 -n 2 -w 1000 > nul
fastboot flash recovery hrb_twrp.img
echo Done!
pause
start hrb.bat
exit
:rom_reboot
echo Rebooting...
@ping 127.0.0.1 -n 1 -w 1000 > nul
fastboot reboot
@ping 127.0.0.1 -n 3 -w 1000 > nul
echo Booting up!
pause
start hrb.bat
exit
:adb_bootloader
echo Bootloader, here we go!
@ping 127.0.0.1 -n 1 -w 1000 > nul
echo If this doesn't work, check if your USB Debugging is activated!
@ping 127.0.0.1 -n 3 -w 1000 > nul
adb reboot bootloader
echo Done!
start hrb.bat
exit
:adb_recovery
echo Off to recovery!
@ping 127.0.0.1 -n 1 -w 1000 > nul
echo If this doesn't work, check if your USB Debugging is activated!
@ping 127.0.0.1 -n 3 -w 1000 > nul
adb reboot recovery
echo Done!
start hrb.bat
exit
:about_cmd
echo This Tool was created by Spamtheboss. Wanna help coding? github.com/lelufg!
@ping 127.0.0.1 -n 2 -w 1000 > nul
echo Early Build 1.0
@ping 127.0.0.1 -n 2 -w 1000 > nul
pause
start hrb.bat
exit
:tool_exit
echo Exiting.
@ping 127.0.0.1 -n 3 -w 1000 > nul
echo Thanks for downloading HRB! Hope it helped!
@ping 127.0.0.1 -n 3 -w 1000 > nul
exit
