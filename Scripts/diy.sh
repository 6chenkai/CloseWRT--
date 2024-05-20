#!/bin/bash
 sed -i '$a src-git smpackage https://github.com/kenzok8/small-package' feeds.conf.default
./scripts/feeds update -a
 
 
./scripts/feeds install -a  

