#!/bin/sh

# Privilege Root
if [ $USER != "root" ]; then
    echo "Permission denied!!"
    exit 1
fi


# Mojibake
if [ `uname` != "Darwin" ]; then
    touch tmp
    cat ~/.bashrc moji-bake.txt > tmp
    mv tmp ~/.bashrc
    rm tmp
fi


# Apt
apt-get -y update
apt-get -y install emacs24-nox
apt-get -y install gcc
apt-get -y install clang
apt-get -y install python
apt-get -y install python3
apt-get -y install python-pip
apt-get -y install python-dev
apt-get -y install gnuplot-qt


# Emacs
if [ `uname` = "Darwin" ]; then
    touch tmp
    cat emacs.txt mac-emacs.txt > tmp
    mv tmp emacs.txt
    rm tmp
fi
mv emacs.txt ~/.emacs


# Language
sudo apt-get -y install ibus
sudo apt-get -y install ibus-mozc


# Latex
<<EOF 
apt-get -y install texlive 
apt-get -y install texlive-lang-cjk
apt-get -y install xdvik-ja
apt-get -y install dvipsk-ja 
apt-get -y install gv 
apt-get -y install texlive-fonts-recommended 
apt-get -y install texlive-fonts-extra 
apt-get -y install texworks
apt-get -y install dvipdfmx
chmod +x pdfplatex.sh
mv /usr/local/bin/
EOF


# DropBox
dr=`pwd`
cd ~ && wget -O - "https://www.dropbox.com/download?plat=lnx.x86_64" | tar xzf -
~/.dropbox-dist/dropboxd
cd $dr


# Other
LANG=C xdg-user-dirs-gtk-update


# Remove file
cd ..
rm -rf SetUp-master/
