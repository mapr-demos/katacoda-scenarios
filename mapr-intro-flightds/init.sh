#!/bin/bash
yum install tcpdump mapr-posix-client-* -y
systemctl restart mapr-posix-client-container
#wget -q -O yelp_academic_dataset_business.json https://www.dropbox.com/s/1vtjirlxw0av07l/yelp_academic_dataset_business.json?dl=0 &
#wget -q -O yelp_academic_dataset_tip.json https://www.dropbox.com/s/btt66nhdwytrh2u/yelp_academic_dataset_tip.json?dl=0
git clone https://github.com/mapr-demos/mapr-db-60-getting-started
postfix stop
rm -f /var/spool/mail/root

# Download lab material
git clone https://github.com/mapr-demos/flightdelayhol
mv /root/flightdelayhol/data/* .
