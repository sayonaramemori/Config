pacman -S grub efibootmgr os-prober exfat-utils

grub-install --target=x86_64-efi --efi-directory=/efi --boot-directory=/efi --bootloader-id=ARCH

ln -s /efi/grub /boot/grub

grub-mkconfig -o /boot/grub/grub.cfg

vim /etc/default/grub
