#!/bin/bash
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part1.sh
# Description: OpenWrt DIY script part 1 (Before Update feeds)
#
# Copyright (c) 2019-2024 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#

# Uncomment a feed source
#sed -i 's/^#\(.*helloworld\)/\1/' feeds.conf.default

# Add a feed source
echo 'src-git helloworld https://github.com/fw876/helloworld' >>feeds.conf.default
#echo 'src-git passwall https://github.com/xiaorouji/openwrt-passwall' >>feeds.conf.default
#!/bin/bash
# diy-part1.sh - 添加CUPS第三方库

echo "添加CUPS打印服务器第三方库"

# 1. 添加CUPS专用feed到feeds.conf.default
echo 'src-git cups https://github.com/Gr4ffy/lede-cups.git' >> feeds.conf.default

# 2. 更新所有feeds（包括新添加的CUPS feed）
./scripts/feeds update -a

# 3. 安装CUPS相关包
./scripts/feeds install cups
./scripts/feeds install luci-app-cups
./scripts/feeds install cups-bjnp
./scripts/feeds install cups-filters

# 4. 安装依赖包
./scripts/feeds install avahi-daemon
./scripts/feeds install avahi-dbus-daemon
./scripts/feeds install kmod-usb-printer

echo "CUPS第三方库添加完成"
