### Home Page For Download 
[MIHOMO](https://wiki.metacubex.one/startup/)

### Preliminary  
```sh 
export GITHUB_PROXY=[https://gh-proxy.com]
export SUB_URL=[YOUR_SUB_URL]

# Downlaod yq for yaml operation
wget $GITHUB_PROXY/https://github.com/mikefarah/yq/releases/download/v4.44.5/yq_linux_amd64 -O yq &&
sudo chmod +x yq &&
sudo mv yq /usr/bin/yq
```

### 1. Download base config  
- Modify the PROXYPLACEHOLDER  
```sh 
wget $GITHUB_PROXY/https://github.com/sayonaramemori/Manuscript/blob/main/config.yaml -O config.yaml &&
chmod 666 ./config.yaml &&
sed -i -e "s|PROXYPLACEHOLDER|$GITHUB_PROXY|g" ./config.yaml
yq -i '.proxy-providers.one.url = strenv(SUB_URL)' ./config.yaml
```

### 2. Generate Proxy Group  
```sh 
sudo mkdir /etc/mihomo/ -p &&
cat ./config.yaml | sudo tee /etc/mihomo/temp.yaml > /dev/null &&
sudo cp /etc/mihomo/temp.yaml /etc/mihomo/config.yaml &&
sudo systemctl restart mihomo
```

### 3. Write Proxy Group to Config  
```sh 
cd /etc/mihomo/ &&
yq ea '. as $item ireduce ({}; . * $item )' "/etc/mihomo/proxies/"`sudo ls /etc/mihomo/proxies` temp.yaml | sudo tee config.yaml > /dev/null &&
sudo systemctl restart mihomo
```

### Monitor Log  
```sh
journalctl -u mihomo -o cat -f
```



