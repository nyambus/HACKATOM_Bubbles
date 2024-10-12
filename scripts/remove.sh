#!/bin/bash

# Остановка сервисов
systemctl stop apache2
systemctl stop nginx
systemctl stop mariadb
systemctl stop vsftpd

# Удаление файлов и директорий
rm -rf /var/www/html/wordpress
rm -rf /home/IvanPopov_IT/ftp
rm -f /etc/apache2/sites-available/wordpress.conf
rm -rf /etc/ssl/wordpress/
rm -f /root/HACKATOM_Bubbles/source/wordpress.zip
rm -f /root/HACKATOM_Bubbles/source/wordpress.sql
rm -f /etc/vsftpd.conf
rm -f /etc/vsftpd.conf.bak
rm -f /etc/sudoers.d/conf_for_wpterm

# Удаление базы данных и пользователя
MYSQL_ROOT_PASSWORD='SV5pk@t4JQV4U'
mysql -u root -p$MYSQL_ROOT_PASSWORD <<EOF
DROP DATABASE wordpress;
DROP USER 'wordpress'@'localhost';
DROP DATABASE personal_data_users;
EOF

# Удаление пользователя для FTP
./remove_user.sh IvanPopov_IT

# Удаление файла с авторизованными ключами
rm -f /root/.ssh/authorized_keys

# Удаление установленных пакетов
apt-get remove --purge apache2 nginx mariadb-server php8.2 libapache2-mod-php python3-pip vsftpd sudo -y
apt-get autoremove --purge -y
apt-get clean

# Сброс пароля для рута (необязательно)
passwd root << EOF
kk
kk
EOF
