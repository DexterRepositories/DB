#!/bin/bash
. /etc/openvpn/login/config.sh
Query="SELECT user_name FROM users WHERE user_name='$USERNAME' AND auth_vpn=md5('$PASSWORD') AND status='live' AND is_freeze=0 AND is_ban=0 AND (duration > 0 OR vip_duration > 0 OR private_duration > 0)"
username=`mysql -u $USER -p$PASS -D $DB -h $HOST -sN -e "$Query"`
[ "$username" != '' ] && [ "$username" = "$USERNAME" ] && echo "user : $username" && echo 'authentication ok.' && exit 0 || echo 'Authentication failed.'; exit 1
