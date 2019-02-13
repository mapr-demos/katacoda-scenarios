#!/bin/bash

# Login
echo "mapr" | maprlogin password -user mapr

# Remove Hive metastore in order to avoid some wierd errors
/opt/mapr/hive/hive-2.3/bin/hive --service metastore --stop
rm -rf /opt/mapr/hive/hive-2.3/bin/metastore_db/
/opt/mapr/hive/hive-2.3/bin/hive --service metastore --start

# Install MapR POSIX client in order to use MapR via NFS
yum install unzip mapr-posix-client-* -y
systemctl restart mapr-posix-client-container

# Disable annoying console email notifications
postfix stop
rm -f /var/spool/mail/root

# Download Zeppelin
wget -P /opt http://us.mirrors.quenda.co/apache/zeppelin/zeppelin-0.8.1/zeppelin-0.8.1-bin-all.tgz 
tar -C /opt/ -xzf /opt/zeppelin-0.8.1-bin-all.tgz
mv /opt/zeppelin-0.8.1-bin-all /opt/zeppelin
# Configure Zeppelin for YARN, Spark, and webui port 7000
echo "export ZEPPELIN_PORT=7000" >> /opt/zeppelin/conf/zeppelin-env.sh
echo "export SPARK_HOME=/opt/mapr/spark/spark-2.3.1" >> /opt/zeppelin/conf/zeppelin-env.sh
echo "export HADOOP_HOME=/opt/mapr/hadoop/hadoop-2.7.0" >> /opt/zeppelin/conf/zeppelin-env.sh

# Start Zeppelin
/opt/zeppelin/bin/zeppelin-daemon.sh start
# Wait for Zeppelin start to complete
until $(curl --output /dev/null --silent --head --fail http://localhost:7000/api); do
    sleep 1
done

####################################################
# Install stuff needed for the Forest Fire notebook
####################################################
sudo yum install python-pip -y
sudo pip install dbfpy requests pandas bs4 websocket-client
wget https://github.com/joewalnes/websocketd/releases/download/v0.3.0/websocketd.0.3.0.i386.rpm
sudo rpm -ivh websocketd.0.3.0.i386.rpm

# add a mapr license needed for snapshots
wget -P /root -O license.txt https://gist.githubusercontent.com/iandow/03198d1d42c117c564eca5e00033bd36/raw/cd8bac1f3ea56a1862f920aa4d48511a073fcb4e/license.txt
maprcli license add -license /root/license.txt -is_file true

git clone https://github.com/mapr-demos/mapr-sparkml-streaming-wildfires

# Import notebook into Zeppelin
cp assets/Forest*.json /root
curl -X POST http://localhost:7000/api/notebook/import -d @"/root/Forest Fire Prediction.json"


