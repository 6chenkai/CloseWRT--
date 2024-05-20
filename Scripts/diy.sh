#!/bin/bash

rm -rf    feeds/luci/applications/luci-app-openclash
rm -rf    feeds/luci/applications/luci-app-passwall
rm -rf    feeds/luci/applications/luci-app-ssr-plus
rm -rf    feeds/luci/applications/luci-app-store
sed -i '1i src-git kenzo https://github.com/kenzok8/openwrt-packages' feeds.conf.default
sed -i '2i src-git small https://github.com/kenzok8/small' feeds.conf.default
./scripts/feeds update -a && rm -rf feeds/luci/applications/luci-app-mosdns
rm -rf feeds/packages/net/{alist,adguardhome,mosdns,xray*,v2ray*,v2ray*,sing*,smartdns}
rm -rf feeds/packages/utils/v2dat
rm -rf feeds/packages/lang/golang
git clone https://github.com/kenzok8/golang feeds/packages/lang/golang

rm -rf    feeds/luci/applications/luci-app-openclash
rm -rf    feeds/luci/applications/luci-app-passwall
rm -rf    feeds/luci/applications/luci-app-ssr-plus


cp -rf  feeds/kenzo/luci-app-openclash    feeds/luci/applications/luci-app-openclash
cp -rf  feeds/kenzo/luci-app-passwall    feeds/luci/applications/luci-app-passwall
cp -rf  feeds/kenzo/luci-app-ssr-plus    feeds/luci/applications/luci-app-ssr-plus
cp -rf  feeds/kenzo/luci-app-mosdns      feeds/luci/applications/luci-app-mosdns

echo >> feeds.conf.default
echo 'src-git istore https://github.com/linkease/istore;main' >> feeds.conf.default
./scripts/feeds update istore
./scripts/feeds install -d y -p istore luci-app-store
./scripts/feeds install -a  

