#!/bin/bash
ln -s /opt/ripple/etc/update-rippled-cron /etc/cron.d/
systemctl restart rippled.service
