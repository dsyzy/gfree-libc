#!/bin/sh

# install som lib
echo "install som lib"
sudo apt-get install gawk -y
sudo apt-get install bison -y
sudo apt-get install gcc-multilib -y
sudo apt-get install g++-multilib -y

cd /
sudo mkdir -p /glibc
cd /glibc
sudo mkdir -p source
cd source


# get the source of glibc
Get_Glibc_Source(){
    if [ ! -d "/glibc/source/glibc-"$1 ]; then
        sudo wget http://mirrors.ustc.edu.cn/gnu/libc/glibc-$1.tar.gz
        sudo tar xf glibc-$1.tar.gz
    else
        echo "[*] /glibc/source/glibc-"$1" already exists..."
    fi
    
}
Install_Glibc_x64(){

    if [ -f "/glibc/x64/"$1"/lib/libc-"$1".so" ];then
        echo "x64 glibc "$1" already installed!"
        return
    fi

    #echo $1
    #echo "/glibc/x64/"$1"/lib/libc-"$1".so"
    sudo mkdir -p /glibc/x64/$1
    #wget http://mirrors.ustc.edu.cn/gnu/libc/glibc-$1.tar.gz
    #tar xf glibc-$1.tar.gz
    cd glibc-$1
    sudo mkdir build
    cd build
    sudo ../configure --prefix=/glibc/x64/$1/ --disable-werror --enable-debug=yes
    sudo make
    sudo make install
    cd ../../
    #sudo rm glibc-$1.tar.gz
    sudo rm -rf ./glibc-$1/build

}


Install_Glibc_x86(){

    if [ -f "/glibc/x86/"$1"/lib/libc-"$1".so" ];then
        echo "x86 glibc "$1" already installed!"
        return
    fi

    #echo $1
    #echo "/glibc/x64/"$1"/lib/libc-"$1".so"
    sudo mkdir -p /glibc/x86/$1
    #wget http://mirrors.ustc.edu.cn/gnu/libc/glibc-$1.tar.gz
    #tar xf glibc-$1.tar.gz
    #cd x86
    cd glibc-$1
    sudo mkdir build
    cd build
    sudo ../configure --prefix=/glibc/x86/$1/ --disable-werror --enable-debug=yes --host=i686-linux-gnu --build=i686-linux-gnu CC="gcc -m32" CXX="g++ -m32" 
    sudo make
    sudo make install
    cd ../../
    #sudo rm glibc-$1.tar.gz
    sudo rm -rf ./glibc-$1/build

}

#delte the tar of glibc
Delete_Glibc_Tar() {
    sudo rm glibc-$1.tar.gz
}

GLIBC_VERSION=$1
#echo ${GLIBC_VERSION}
if [ -n "$GLIBC_VERSION" ]; then
    #echo 1
    #cd x64
    Get_Glibc_Source $GLIBC_VERSION
    Install_Glibc_x64 $GLIBC_VERSION
    #cd ..
    #cd x86
    Install_Glibc_x86 $GLIBC_VERSION
    Delete_Glibc_Tar $GLIBC_VERSION
    #cd ..
else
    for GLIBC_VERSION in '2.19' '2.23' '2.24' '2.25' '2.26' '2.27' '2.28' '2.29'
    do
        #echo 2
        #cd x64
        Get_Glibc_Source $GLIBC_VERSION
        Install_Glibc_x64 $GLIBC_VERSION
        #cd ../x86
        Install_Glibc_x86 $GLIBC_VERSION
        Delete_Glibc_Tar $GLIBC_VERSION
        #cd ..
    done
fi
