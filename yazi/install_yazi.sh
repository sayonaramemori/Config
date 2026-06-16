pacman -S ffmpeg 7zip jq poppler fd ripgrep fzf zoxide resvg imagemagick &&
mkdir -p ~/.config/yazi/
ya pkg add yazi-rs/plugins:full-border 
ya pkg add yazi-rs/plugins:git
ya pkg add h-hg/yamb
cp ./init.lua ~/.config/yazi/init.lua
cp ./keymap.toml ~/.config/yazi/keymap.toml
cp ./yazi.toml ~/.config/yazi/yazi.toml
