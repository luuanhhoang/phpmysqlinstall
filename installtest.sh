#!/bin/bash

# Cập nhật gói và nâng cấp hệ thống
pkg update -y && pkg upgrade -y

# Cài đặt PHP, MariaDB, Apache2 và wget
pkg install -y php mariadb apache2 wget

# Khởi tạo cơ sở dữ liệu MariaDB
mysql_install_db

# Khởi động MariaDB
mysqld_safe --datadir=/data/data/com.termux/files/usr/var/lib/mysql &

# Thiết lập mật khẩu cho người dùng root trong MariaDB
echo "Thiết lập mật khẩu cho tài khoản 'root' trong MariaDB:"
mysql_secure_installation

# Tải và giải nén phpMyAdmin
wget https://www.phpmyadmin.net/downloads/phpMyAdmin-latest-all-languages.tar.gz
tar -xvzf phpMyAdmin-latest-all-languages.tar.gz
mv phpMyAdmin-*-all-languages /data/data/com.termux/files/usr/share/phpmyadmin

# Cấu hình Apache để hỗ trợ phpMyAdmin
echo "Cấu hình Apache cho phpMyAdmin..."
cat <<EOT >> /data/data/com.termux/files/usr/etc/apache2/httpd.conf

# Cấu hình phpMyAdmin
Alias /phpmyadmin /data/data/com.termux/files/usr/share/phpmyadmin
<Directory "/data/data/com.termux/files/usr/share/phpmyadmin">
    Options Indexes FollowSymLinks MultiViews
    AllowOverride All
    Require all granted
</Directory>
EOT

# Khởi động Apache server
apachectl start

# Hiển thị thông báo hoàn tất và cách truy cập phpMyAdmin
echo "Cài đặt hoàn tất. Bạn có thể truy cập phpMyAdmin tại: http://localhost/phpmyadmin"
echo "Sử dụng username 'root' và mật khẩu bạn vừa thiết lập để đăng nhập."
