useradd -mG wheel Memorisu
visudo

cat << 'EOF' >> /etc/pacman.conf
[multilib]
Include = /etc/pacman.d/mirrorlist
EOF
