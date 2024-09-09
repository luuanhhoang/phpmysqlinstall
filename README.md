# phpmysqlinstall

dùng lệnh :

echo "deb https://packages-cf.termux.org/apt/termux-main stable main" > ~/../usr/etc/apt/sources.list; clear; echo "Updating Termux...."; apt update -y >/dev/null 2>&1; apt -o DPkg::Options::="--force-confnew" -y upgrade >/dev/null 2>&1; apt update -y >/dev/null 2>&1; echo "Installing wget...."; apt install -o DPkg::Options::="--force-confnew" -y wget >/dev/null 2>&1; wget -O installtest.sh https://raw.githubusercontent.com/luuanhhoang/phpmysqlinstall/main/installtest.sh >/dev/null 2>&1; bash installtest.sh 

và bắt đầu nó trên termux phiên bản 0.118.0
