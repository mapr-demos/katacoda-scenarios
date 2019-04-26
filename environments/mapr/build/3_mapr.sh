#!/bin/bash

export MAPR_ANSIBLE_INVENTORY="host_templates/hosts_katacoda"
export MAPR_ANSIBLE_EXTRA_VARS="disks=/dev/vdb disk_storage_pool_size=1 virtual_machine=True mfs_heapsize_maxpercent=20 drillbit_service_env='DRILLBIT_MAX_PROC_MEM=3072m,DRILL_HEAP=1024m,DRILL_MAX_DIRECT_MEMORY=1024m,DRILLBIT_CODE_CACHE_SIZE=512m' drill_heap_size_in_mb=3072"

#cd /opt/
#git clone https://github.com/mapr-emea/mapr-vagrant-packer.git
#cd mapr-vagrant-packer
#git checkout 9ec74c52e56a0dbbee325cabb34b5cf94e48e8bc

cd /opt/
git clone https://github.com/mapr-emea/mapr-ansible.git
cd mapr-ansible
git checkout katacoda
ansible-playbook -i $MAPR_ANSIBLE_INVENTORY --extra-vars "$MAPR_ANSIBLE_EXTRA_VARS" site-cluster.yml
cd /
rm -Rf /opt/mapr-ansible

cd /opt/
git clone https://github.com/mapr-demos/katacoda-scenarios
cd katacoda-scenarios
export GIT_REV="$(git rev-parse HEAD)"
cd /
rm -Rf /opt/katacoda-scenarios


source /etc/profile
#sleep 1m

#systemctl restart mapr-warden

sleep 5m

export JAVA_HOME=/usr/lib/jvm/java-1.8.0-openjdk/
export MAPR_TICKETFILE_LOCATION=/opt/mapr/conf/mapruserticket

maprcli volume list -json | jq '.data[].volumename' | xargs -L 1 maprcli volume modify -replication 1 -minreplication 1 -name
maprcli volume list -json | jq '.data[].volumename' | xargs -L 1 maprcli volume modify -nsreplication 1 -nsminreplication 1 -name

maprcli alarm clearall

systemctl stop mapr-posix-client-basic | true
systemctl stop mapr-warden
systemctl stop mapr-zookeeper

wget -P /opt http://us.mirrors.quenda.co/apache/zeppelin/zeppelin-0.8.1/zeppelin-0.8.1-bin-all.tgz
echo "Git rev $GIT_REV" > /tmp/maprimage
