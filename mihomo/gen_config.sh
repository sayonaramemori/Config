export GITHUB_PROXY=https://gh-proxy.com
export SUB_URL="https://naiun.adfgawidhioawjd.site/api/v1/client/subscribe?token=c1d679e53d6940e29c7403f19672f3dc"
echo "Your url is $YOUR_SUB_URL"

#wget $GITHUB_PROXY/https://github.com/sayonaramemori/Manuscript/blob/main/config.yaml -O config.yaml &&
cp ./base_config.yaml config.yaml
chmod 666 ./config.yaml && 
sed -i -e "s|PROXYPLACEHOLDER|$GITHUB_PROXY|g" ./config.yaml
yq -i '.proxy-providers.one.url = strenv(SUB_URL)' ./config.yaml


