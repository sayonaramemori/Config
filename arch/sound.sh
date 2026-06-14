sudo pacman -S --needed pipewire wireplumber pipewire-pulse pipewire-alsa pipewire-jack 
systemctl --user enable --now pipewire pipewire-pulse wireplumber

sudo pacman -S power-profiles-daemon
sudo systemctl enable --now power-profiles-daemon

sudo pacman -S --needed bluez
sudo systemctl enable --now bluetooth

sudo pacman -S noto-fonts noto-fonts-cjk noto-fonts-emoji ttf-jetbrains-mono-nerd
