#!/bin/bash

if [ $# -ne 1 ]; then
    echo "Usage: $0 <IP-адрес>"
    exit 1
fi

USER_IP=$1
mysql -u root -po <<EOF
USE wordpress;
UPDATE wp_options SET option_value='https://$USER_IP' WHERE option_name='home';
UPDATE wp_options SET option_value='https://$USER_IP' WHERE option_name='siteurl';
EOF
