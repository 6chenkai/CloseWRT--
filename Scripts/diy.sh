#!/bin/bash

rm -rf    feeds/luci/applications/luci-app-openclash
rm -rf    feeds/luci/applications/luci-app-passwall
rm -rf    feeds/luci/applications/luci-app-ssr-plus
rm -rf    feeds/luci/applications/luci-app-store

rm -rf feeds/packages/lang/golang
git clone https://github.com/sbwml/packages_lang_golang -b 22.x feeds/packages/lang/golang
sed -i '$a src-git smpackage https://github.com/kenzok8/small-package' feeds.conf.default
./scripts/feeds update -a
rm -rf feeds/smpackage/{base-files,dnsmasq*,firewall*,fullconenat,libnftnl,nftables,ppp,opkg,ucl,upx,vsftpd-alt,miniupnpd-iptables,wireless-regdb,luci-app-store}
rm -rf    feeds/luci/applications/luci-app-openclash
rm -rf    feeds/luci/applications/luci-app-passwall
rm -rf    feeds/luci/applications/luci-app-ssr-plus
rm -rf    feeds/luci/applications/luci-app-store
echo >> feeds.conf.default
echo 'src-git istore https://github.com/linkease/istore;main' >> feeds.conf.default
./scripts/feeds update istore
./scripts/feeds install -d y -p istore luci-app-store
./scripts/feeds install -a  

rm -rf    feeds/luci/applications/luci-app-openclash
rm -rf    feeds/luci/applications/luci-app-passwall
rm -rf    feeds/luci/applications/luci-app-ssr-plus
rm -rf    feeds/luci/applications/luci-app-store
