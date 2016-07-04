#!/bin/bash

# HotROM Box Official port for Linux.
# Warning: This was only tested on Debian based distros!
# Official Release only on Github Repo.

zenity --info --title "The HotROM Box - Linux" --text "Welcome to HotROM for Linux! This is a WIP, so there's a high possibility of changes!. \n \n WRN: This build is being tested on Ubuntu 16.04" --width=400 --height=200

zenity --warning --title "The HotROM Box - Linux" --text "Be advised that this tool only provides the script AND the custom recovery (via download). Stock files must be downloaded apart.\n \n Currently working on: Moto G 2014 (Titan) and Moto G 2015 (Osprey)" --width=400 --height=200

if [[ $menu == false ]]; then
	zenity --error -- title "The HotROM Box - Linux" --text "Sorry, but something happened with The HotROM Box. Try reopening the application, and if the error persists please contact me: luizaugusto@linuxmail.org"
fi

menu=$(zenity  --title "The HotROM Box - Linux" --list  --text "Select an option: " --checklist  --column "Select" --column "Code" --column "Name"\
	FALSE "ospreymm" "Flash MM Stock ROM (Moto G 3rd Gen)"\
	FALSE "titanmm" "Flash MM Stock ROM (Moto G 2nd Gen)"\
	FALSE "titanlp" "Flash LP Stock ROM (Moto G 2nd Gen)"\
	FALSE "titankk" "Flash KK Stock ROM (Moto G 2nd Gen)"\
	FALSE "recoverytitan" "Flash Custom Recovery (Titan)"\
	FALSE "recoveryosprey" "Flash Custom Recovery (Osprey)"\
	FALSE "reboot" "Reboot your Phone"\
	FALSE "vote" "Tell me what you think about HRB!"\
    --separator=":" --width=500 --height=500)

if [[ $menu =~ "ospreymm" ]]; then
	# OSPREY
  	# Let's check if the user have fastboot installed
  	sudo apt-get install android-tools-fastboot
	fastboot flash logo logo.bin
	fastboot flash boot boot.img
	fastboot flash recovery recovery.img
	fastboot flash system system.img_sparsechunk.0
	fastboot flash system system.img_sparsechunk.1
	fastboot flash system system.img_sparsechunk.2
	fastboot flash system system.img_sparsechunk.3
	fastboot flash system system.img_sparsechunk.4
	fastboot flash system system.img_sparsechunk.5
	fastboot flash modem NON-HLOS.bin
	fastboot erase modemst1 
	fastboot erase modemst2 
	fastboot flash fsg fsg.mbn
	fastboot erase cache 
	fastboot erase userdata
	fastboot reboot
  	zenity --info --title "Done!" --text "Android 6.0 a.k.a Marshmallow is now installed in your device!"
fi

if [[ $menu =~ "titanmm" ]]; then
	# TITAN
	# Let's check if the user have fastboot installed
  	sudo apt-get install android-tools-fastboot
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
	fastboot reboot
  	zenity --info --title "Done!" --text "Android 6.0 a.k.a Mashmallow is now installed in your device!"
fi

if [[ $menu =~ "titanlp" ]]; then
	# TITAN
	# Let's check if the user have fastboot installed
  	sudo apt-get install android-tools-fastboot
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
	fastboot reboot
  	zenity --info --title "Done!" --text "Android 5.0 a.k.a Lollipop is now installed in your device!"
fi

if [[ $menu =~ "titankk" ]]; then
	# TITAN
	# Let's check if the user have fastboot installed
  	sudo apt-get install android-tools-fastboot
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
	fastboot reboot
  	zenity --info --title "Done!" --text "Android 4.4 a.k.a KitKat is now installed in your device!"
fi

if [[ $menu =~ "recoverytitan" ]]; then
	# Let's check if the user have fastboot installed
  	sudo apt-get install android-tools-fastboot
	wget -o titan.img http://fs1.d-h.st/download/00144/fQe/TWRP_2.8.0.1_Titan_v2.img
  	fastboot flash recovery titan.img
  	zenity --info --title "Done!" --text "TWRP is now installed as your new recovery!"
fi

if [[ $menu =~ "recoveryosprey" ]]; then
        # Let's check if the user have fastboot installed
        sudo apt-get install android-tools-fastboot
        wget -o osprey.img http://get.xda-developers.com/dl/1/1/0/5/1/twrp-osprey-3.0.2-r1.img?key=qXepJ6kxpfiI8TvqmvDgBw&ts=1467659948
        fastboot flash recovery osprey.img
        zenity --info --title "Done!" --text "TWRP is now installed as your new recovery!"
fi

if [[ $menu =~ "reboot" ]]; then
	# Let's check if the user have adb installed
	sudo apt-get install android-tools-adb
	fastboot reboot
	zenity --info --title "Done!" --text "Your phone is now rebooting..."
fi

if [[ $menu =~ "vote" ]]; then
	# Opens "Straw Poll" with the actual Poll
	python -mwebbrowser http://www.strawpoll.me/10664791
fi
