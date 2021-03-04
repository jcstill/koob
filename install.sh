#!/bin/bash

mv koob /usr/bin/
mv koob.service /etc/systemd/system/
chmod 640 /etc/systemd/system/koob.service
systemctl daemon-reload
systemctl enable koob.service
systemctl restart koob.service
