#!/bin/bash
echo "安装将花费一定时间，请耐心等待直到安装完成^_^"
if which apt-get >/dev/null; then
    sudo apt-get install -y tmux git
elif which yum >/dev/null; then
    sudo yum install -y gcc tmux git 
fi

##Add HomeBrew support on Mac OS
if which brew >/dev/null;then
    echo "You are using HomeBrew tool"
    brew install tmux git
fi

if [ -d /tmp/tmux_theme ]; then
    rm -rf /tmp/tmux_theme;
fi
cd /tmp/ && git clone https://github.com/mesopodamia/tmux_theme.git
if [ -f ~/.tmux.conf ]; then
    mv -f ~/.tmux.conf ~/.tmux.conf_old
fi

if which brew > /dev/null; then
    mv -f /tmp/tmux_theme/mac_theme ~/.tmux.conf
else
    mv -f /tmp/tmux_theme/centos_theme ~/.tmux.conf
fi 
echo "安装完毕将自动退出" >> /tmp/tmux_install.log
echo "请耐心等待" >> /tmp/tmux_install.log
echo "安装完成"
