cd ~/.config/mihomo/ &&
fff=`ls ${HOME}/.config/mihomo/proxies`
yq ea '. as $item ireduce ({}; . * $item )' "${HOME}/.config/mihomo/proxies/$fff" temp.yaml | tee config.yaml > /dev/null
sudo mihomo -d ~/.config/mihomo
