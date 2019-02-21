#!/bin/bash

# Login
echo "mapr" | maprlogin password -user mapr

# Add a mapr license needed for snapshots
wget -P /root https://raw.githubusercontent.com/mapr-demos/katacoda-scenarios/master/spark_with_zeppelin/assets/mapr_license.txt
maprcli license add -license /root/mapr_license.txt -is_file true

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

