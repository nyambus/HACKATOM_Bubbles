#!/bin/bash

#Создание папки для 1 шага
mkdir -p /home/IvanPopov_IT/ftp/FilesForMyFirstJob
chmod 555 /home/IvanPopov_IT/ftp
chown IvanPopov_IT:IvanPopov_IT -R /home/IvanPopov_IT/ftp

#Создание ссылки на users.php, добавление readme файла и установка прав

echo 'Привет, Иван. Сделал тебе доступ только к одному файлу, остальное не пригодится.' > /home/IvanPopov_IT/ftp/FilesForMyFirstJob/readme_ftp.txt
echo 'Я в коде не очень хорошо разбираюсь, но там что-то с проверкой пароля.' >> /home/IvanPopov_IT/ftp/FilesForMyFirstJob/readme_ftp.txt
echo 'Файлик не удаляй, просто поменяй, что понадобится - ВП подхватит чего надо.' >> /home/IvanPopov_IT/ftp/FilesForMyFirstJob/readme_ftp.txt
echo 'Как закончишь с user.php - зайди в медиафайлы, у меня возникла проблема с картинкой fix_me_pls.png, когда редактировал ее в HEX. Попробуй написать скрипт или поправить вручную.' >> /home/IvanPopov_IT/ftp/FilesForMyFirstJob/readme_ftp.txt

#chmod 777 /home/IvanPopov_IT/ftp/FilesForMyFirstJob/user.php
chmod 777 /home/IvanPopov_IT/ftp/FilesForMyFirstJob/readme_ftp.txt

apt install vsftpd -y
cp /etc/vsftpd.conf{,.bak}

echo 'listen=YES
listen_ipv6=NO
anonymous_enable=NO
local_enable=YES
dirmessage_enable=YES
use_localtime=YES
xferlog_enable=YES
connect_from_port_20=YES
secure_chroot_dir=/var/run/vsftpd/empty
pam_service_name=vsftpd
ssl_enable=NO
write_enable=YES

#new
chroot_local_user=YES
local_enable=YES
local_root=/home/IvanPopov_IT/ftp' > /etc/vsftpd.conf

#Для входа юзера с nologin
echo "/usr/sbin/nologin" >> /etc/shells
sed -i 's/^auth required pam_shells.so/# &/' /etc/pam.d/vsftpd

systemctl --now enable vsftpd
systemctl restart vsftpd
systemctl status vsftpd
