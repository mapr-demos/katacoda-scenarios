#!/bin/bash

cd /opt/
git clone https://github.com/mapr-emea/mapr-vagrant-packer.git
cd mapr-vagrant-packer
git checkout 866be7512681fd43b405a321d445bcb93756d569

cd /opt/
git clone https://github.com/mapr-emea/mapr-ansible.git
cd mapr-ansible
git checkout 26c173eb7301b42070133affe0317593066c9548
ansible-playbook -i ../mapr-vagrant-packer/$MAPR_ANSIBLE_INVENTORY --extra-vars "$MAPR_ANSIBLE_EXTRA_VARS" site-cluster.yml

wget -P /opt http://us.mirrors.quenda.co/apache/zeppelin/zeppelin-0.8.1/zeppelin-0.8.1-bin-all.tgz
