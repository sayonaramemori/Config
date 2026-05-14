cd ~/.config/mihomo/ &&
yq ea '. as $item ireduce ({}; . * $item )' "${HOME}/.config/mihomo/proxies/"`ls ${HOME}/.config/mihomo/proxies` temp.yaml | tee config.yaml > /dev/null &&
sleep 3 &&
mihomo -d ~/.config/mihomo
