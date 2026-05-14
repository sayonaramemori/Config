mkdir ~/.config/mihomo/ -p &&
mv ./config.yaml ~/.config/mihomo/temp.yaml &&
cp ~/.config/mihomo/temp.yaml ~/.config/mihomo/config.yaml &&
mihomo -d ~/.config/mihomo
