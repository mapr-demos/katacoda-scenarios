#!/bin/bash

export MAPR_ANSIBLE_INVENTORY="ansible_inventory/hosts_mapr_hive_drill"
export MAPR_ANSIBLE_EXTRA_VARS="disks=/dev/vdb disk_storage_pool_size=1 virtual_machine=True hive_db_type=embedded"

cd /opt/
git clone https://github.com/mapr-emea/mapr-vagrant-packer.git
cd mapr-vagrant-packer
git checkout 9ec74c52e56a0dbbee325cabb34b5cf94e48e8bc

cd /opt/
git clone https://github.com/mapr-emea/mapr-ansible.git
cd mapr-ansible
git checkout 977b9a0f90684a693fb94debf01020220fc1f079
ansible-playbook -i ../mapr-vagrant-packer/$MAPR_ANSIBLE_INVENTORY --extra-vars "$MAPR_ANSIBLE_EXTRA_VARS" site-cluster.yml

wget -P /opt http://us.mirrors.quenda.co/apache/zeppelin/zeppelin-0.8.1/zeppelin-0.8.1-bin-all.tgz
echo "v1" > /tmp/maprimage
