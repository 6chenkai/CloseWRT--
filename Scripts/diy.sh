#!/bin/bash
 sed -i '$a src-git smpackage https://github.com/kenzok8/small-package' feeds.conf.default
./scripts/feeds update -a
 rm -rf feeds/luci/applications/luci-app-mosdns
 rm -rf feeds/luci/applications/luci-app-passwall
 rm -rf feeds/luci/applications/luci-app-ssr-plus
 rm -rf feeds/luci/applications/luci-app-openclash
 
 cp -rf feeds/smpackage/luci-app-openclash   feeds/luci/applications/luci-app-openclash
 cp -rf feeds/smpackage/luci-app-ssr-plus   feeds/luci/applications/luci-app-ssr-plus
 cp -rf feeds/smpackage/luci-app-passwall   feeds/luci/applications/luci-app-passwall
 cp -rf feeds/smpackage/luci-app-mosdns  feeds/luci/applications/luci-app-mosdns
 
 rm -rf feeds/packages/net/{alist,adguardhome,mosdns,xray*,v2ray*,v2ray*,sing*,smartdns}
 rm -rf feeds/packages/utils/v2dat
 
./scripts/feeds install -a  

