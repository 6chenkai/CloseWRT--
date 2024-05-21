#!/bin/bash
 sed -i '$a src-git smpackage https://github.com/kenzok8/small-package' feeds.conf.default
./scripts/feeds update -a 
rm -rf feeds/luci/applications/luci-app-clash
cp -rf feeds/smpackage/luci-app-clash   feeds/luci/applications/luci-app-clash

./scripts/feeds install -a  

