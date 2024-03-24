#!/bin/bash

rm -rf    feeds/luci/applications/luci-app-openclash
rm -rf    feeds/luci/applications/luci-app-passwall
rm -rf    feeds/luci/applications/luci-app-ssr-plus


rm -rf feeds/packages/lang/golang
git clone https://github.com/sbwml/packages_lang_golang -b 22.x feeds/packages/lang/golang

./scripts/feeds update

rm -rf feeds/smpackage/{base-files,dnsmasq,firewall*,fullconenat,libnftnl,nftables,ppp,opkg,ucl,upx,vsftpd-alt,miniupnpd-iptables,wireless-regdb}
./scripts/feeds install -a  

