#!/bin/bash
yum install tcpdump mapr-posix-client-* -y
systemctl restart mapr-posix-client-container
#wget -q -O yelp_academic_dataset_business.json https://www.dropbox.com/s/1vtjirlxw0av07l/yelp_academic_dataset_business.json?dl=0 &
#wget -q -O yelp_academic_dataset_tip.json https://www.dropbox.com/s/btt66nhdwytrh2u/yelp_academic_dataset_tip.json?dl=0
git clone https://github.com/mapr-demos/mapr-db-60-getting-started
postfix stop
rm -f /var/spool/mail/root

wget -P /opt http://apache.claz.org/zeppelin/zeppelin-0.8.1/zeppelin-0.8.1-bin-netinst.tgz
tar -C /opt/ -xzf /opt/zeppelin-0.8.1-bin-netinst.tgz
mv /opt/zeppelin-0.8.1-bin-netinst /opt/zeppelin
echo "export ZEPPELIN_PORT=7000" >> /opt/zeppelin/conf/zeppelin-env.sh
echo "export ZEPPELIN_SSL_PORT=7443" >> /opt/zeppelin/conf/zeppelin-env.sh
echo "export MASTER=yarn-client" >> /opt/zeppelin/conf/zeppelin-env.sh
echo "export SPARK_HOME=/opt/mapr/spark/spark-*" >> /opt/zeppelin/conf/zeppelin-env.sh
echo "export HADOOP_HOME=/opt/mapr/hadoop/hadoop-*" >> /opt/zeppelin/conf/zeppelin-env.sh

/opt/zeppelin/bin/zeppelin-daemon.sh start

