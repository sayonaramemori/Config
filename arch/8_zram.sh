pacman -S zram-generator

cat << 'EOF' > /etc/systemd/zram-generator.conf
[zram0]
zram-size = ram
compression-algorithm = zstd
EOF

# Edit GRUB_CMDLINE_LINUX_DEFAULT="loglevel=5 zswap.enabled=0"
vim /etc/default/grub && grub-mkconfig -o /boot/grub/grub.cfg

# exit && reboot

