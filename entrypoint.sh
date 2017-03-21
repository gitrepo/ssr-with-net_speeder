#!/bin/bash

PASS=${ROOT_PASS:-$(pwgen -s 12 1)}
_word=$( [ ${ROOT_PASS} ] && echo "preset" || echo "random" )
echo "=> Setting a ${_word} password to the root user"
echo "root:$PASS" | chpasswd

echo "=> Done!"

echo "========================================================================"
echo "You can now connect to this container via SSH using:"
echo ""
echo "    ssh -p <port> root@<host>"
echo "and enter the root password '$PASS' when prompted"
echo ""
echo "Please remember to change the above password as soon as possible!"
echo "========================================================================"

nohup /usr/sbin/sshd -D &
nohup /usr/local/bin/net_speeder eth0 "ip" >/dev/null 2>&1 &
#/etc/init.d/redis-server start &
#sleep 10
#ntopng  --community --daemon &
python /root/ssr/shadowsocks/server.py -s 0.0.0.0 -p 8388 -m chacha20-ietf -k $SSR_PASS -o tls1.2_ticket_auth -O auth_aes128_sha1
