#!/bin/bash

# Install MapR POSIX client in order to use MapR via NFS
yum install mapr-posix-client-* -y
systemctl restart mapr-posix-client-container

# Disable annoying console email notifications
postfix stop
rm -f /var/spool/mail/root

# Download Zeppelin
wget -P /opt http://apache.claz.org/zeppelin/zeppelin-0.8.1/zeppelin-0.8.1-bin-netinst.tgz
tar -C /opt/ -xzf /opt/zeppelin-0.8.1-bin-netinst.tgz
mv /opt/zeppelin-0.8.1-bin-netinst /opt/zeppelin
# Configure Zeppelin for YARN, Spark, and webui port 7000
echo "export ZEPPELIN_PORT=7000" >> /opt/zeppelin/conf/zeppelin-env.sh
echo "export MASTER=yarn-client" >> /opt/zeppelin/conf/zeppelin-env.sh
echo "export SPARK_HOME=/opt/mapr/spark/spark-2.3.1" >> /opt/zeppelin/conf/zeppelin-env.sh
echo "export HADOOP_HOME=/opt/mapr/hadoop/hadoop-2.7.0" >> /opt/zeppelin/conf/zeppelin-env.sh
echo "mapr" | maprlogin password -user mapr
# Start Zeppelin
/opt/zeppelin/bin/zeppelin-daemon.sh start
# Wait for Zeppelin start to complete
until $(curl --output /dev/null --silent --head --fail http://localhost:7000/api); do
    sleep 1
done
# Download sample Zeppelin notebook
wget -P /root/ https://raw.githubusercontent.com/mapr-demos/predictive-maintenance/master/notebooks/zeppelin/RNN%20predictions%20on%20MapR-DB%20data%20via%20Drill.json
# Import notebook into Zeppelin
curl -X POST http://localhost:7000/api/notebook/import -d @"/root/RNN predictions on MapR-DB data via Drill.json"
