#!/bin/bash

rm -rf    feeds/luci/applications/luci-app-openclash
rm -rf    feeds/luci/applications/luci-app-passwall
rm -rf    feeds/luci/applications/luci-app-ssr-plus
rm -rf    feeds/luci/applications/luci-app-store


sed -i '$a src-git smpackage https://github.com/kenzok8/small-package' feeds.conf.default
./scripts/feeds update -a
rm -rf feeds/smpackage/{base-files,dnsmasq*,firewall*,fullconenat,libnftnl,nftables,ppp,opkg,ucl,upx,vsftpd-alt,miniupnpd-iptables,wireless-regdb,luci-app-store}
rm -rf feeds/packages/net/{alist,adguardhome,mosdns,xray*,v2ray*,v2ray*,sing*,smartdns}
rm -rf feeds/packages/utils/v2dat
rm -rf feeds/packages/lang/golang
git clone https://github.com/kenzok8/golang feeds/packages/lang/golang
rm -rf    feeds/luci/applications/luci-app-openclash
rm -rf    feeds/luci/applications/luci-app-passwall
rm -rf    feeds/luci/applications/luci-app-ssr-plus


cp -rf  feeds/smpackage/luci-app-openclash    feeds/luci/applications/luci-app-openclash
cp -rf  feeds/smpackage/luci-app-passwall    feeds/luci/applications/luci-app-passwall
cp -rf  feeds/smpackage/luci-app-ssr-plus    feeds/luci/applications/luci-app-ssr-plus
cp -rf  feeds/smpackage/luci-app-mosdns      feeds/luci/applications/luci-app-mosdns

echo >> feeds.conf.default
echo 'src-git istore https://github.com/linkease/istore;main' >> feeds.conf.default
./scripts/feeds update istore
./scripts/feeds install -d y -p istore luci-app-store
./scripts/feeds install -a  

