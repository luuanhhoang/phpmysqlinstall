#!/bin/bash

function start_kali() {
  echo "Khởi động Kali Linux ảo..."
  proot-distro login kali & # Khởi động Kali Linux trong Termux
  
  # Hiển thị IP và thiết lập mật khẩu SSH
  echo "Thiết lập SSH và hiển thị thông tin mạng..."
  apt update
  apt install -y openssh-server
  service ssh start

  # Hiển thị địa chỉ IP
  ip a | grep inet
  
  # Tạo mật khẩu ngẫu nhiên cho root
  pass=$(openssl rand -base64 12)
  echo "root:$pass" | chpasswd
  echo "Mật khẩu root: $pass"
}

function stop_kali() {
  echo "Đang dừng máy ảo Kali Linux..."
  pkill -f "proot-distro login kali"
}

if [[ "$1" == "--start" ]]; then
  start_kali
elif [[ "$1" == "--stop" ]]; then
  stop_kali
else
  echo "Sử dụng lệnh: --start để bắt đầu hoặc --stop để dừng."
fi
