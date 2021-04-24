#!/bin/bash
if [ "$EUID" -ne 0 ];then
	>&2 printf "\e[38;2;255;0;0m[!]\e[0m Please run as root\n"
	exit 1
fi
cp koob /usr/bin/
cp koob.service /etc/systemd/system/
chmod 640 /etc/systemd/system/koob.service
systemctl daemon-reload
systemctl enable koob.service
systemctl restart koob.service
mkdir -p /usr/local/man/man8
install -g 0 -o 0 -m 0644 koob.8 /usr/local/man/man8/
gzip /usr/local/man/man8/koob.8
mandb