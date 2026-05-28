export GITHUB_PROXY=https://gh-proxy.com
export SUB_URL="https://naiun.adfgawidhioawjd.site/api/v1/client/subscribe?token=c1d679e53d6940e29c7403f19672f3dc"
#export SUB_URL="https://0b96e976-9ec3-44c0-aa2b-30bf8b0792ea.com/sabusuku?token=8d4a4eb487bf6086f7e2a5749540d075"
#export SUB_URL="https://sub.xfltd.me/cctv/user/client/get?token=NjUwNjYxOmFmYmI2YjgzMjY5NDYxNTE1ODQ3OWMxODE2YjM2MWZkN2MyMTM4ZmI"
echo "Your url is $SUB_URL"

#wget $GITHUB_PROXY/https://github.com/sayonaramemori/Manuscript/blob/main/config.yaml -O config.yaml &&
cp ./base_config.yaml config.yaml
chmod 666 ./config.yaml && 
sed -i -e "s|PROXYPLACEHOLDER|$GITHUB_PROXY|g" ./config.yaml
yq -i '.proxy-providers.one.url = strenv(SUB_URL)' ./config.yaml


