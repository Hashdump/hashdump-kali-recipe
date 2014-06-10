#!/bin/bash

# Kali Linux ISO recipe for : Hashdump
#########################################################################################
# Desktop 	: XFCE4
# Metapackages	: kali-linux-full
# ISO size 	: 2.7 GB
# Special notes	: A custom kali for hashdump without an autologin to prevent misuse of the lab
#		: This script is not meant to run unattended.
# Look and Feel	: Custom wallpaper, configs, bashrc (terrorshell), and more
# Background	: http://www.offensive-security.com/kali-linux/kali-linux-recipes/
#########################################################################################

# Update and install dependencies
apt-get update
apt-get install git live-build cdebootstrap devscripts -y

cat > config/package-lists/kali.list.chroot << EOF
kali-root-login
kali-linux-full
kali-defaults
kali-menu
kali-debtags
kali-archive-keyring
debian-installer-launcher
alsa-tools
locales-all
xorg
kali-linux-top10
xfce4
xfce4-goodies
vim
vim-gtk
iceweasel
EOF

lb config --bootappend-live "boot=live config noautologin hostname=hashdump"
# Go ahead and run the build!
lb build
