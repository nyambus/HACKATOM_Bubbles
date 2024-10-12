#!/bin/bash

bash /root/HACKATOM_Bubbles/scripts/network.sh
bash /root/HACKATOM_Bubbles/scripts/permissions_password.sh
bash /root/HACKATOM_Bubbles/scripts/install_wp.sh
bash /root/HACKATOM_Bubbles/scripts/vsftpd.sh
bash /root/HACKATOM_Bubbles/scripts/sudoers.sh
bash /root/HACKATOM_Bubbles/scripts/remove_user.sh kk
bash /root/HACKATOM_Bubbles/scripts/postfix.sh
bash /root/HACKATOM_Bubbles/scripts/remove_left.sh
