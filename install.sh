#!/bin/bash
set -e

if [ `whoami` = "root" ];then
	echo "root用户！"
else
	echo "非root用户运行，无法执行安装！"
	exit
fi

if command -v apt >/dev/null 2>&1; then
    apt install patchelf
elif command -v yum >/dev/null 2>&1;then
    yum install patchelf
else
    echo "Now it does not support your arch!"
fi

# set for bash
chmod 777 build
chmod 777 gclibc
mv gclibc /usr/local/bin/
mv build /usr/local/bin/