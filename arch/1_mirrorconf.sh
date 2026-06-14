timedatectl set-ntp true 
reflector -p https -a 12 -c cn --v --sort rate --save /etc/pacman.d/mirrorlist 
pacman -Sy archlinux-keyring
