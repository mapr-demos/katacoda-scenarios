#!/bin/bash
yum install tcpdump mapr-posix-client-* -y
systemctl restart mapr-posix-client-container
#git clone https://github.com/mapr-demos/mapr-db-60-getting-started
#postfix stop
#rm -f /var/spool/mail/root

# Download lab material
git clone https://github.com/mapr-demos/flightdelayhol
mv /root/flightdelayhol/data/* .
