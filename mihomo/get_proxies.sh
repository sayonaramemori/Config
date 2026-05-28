mkdir ~/.config/mihomo/ -p &&
cp ./config.yaml ~/.config/mihomo/temp.yaml &&
cp ~/.config/mihomo/temp.yaml ~/.config/mihomo/config.yaml &&
#rm ~/.config/mihomo/proxies/* &&
sudo mihomo -d ~/.config/mihomo
