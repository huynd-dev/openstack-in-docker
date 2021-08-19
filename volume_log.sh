#!/bin/bash

for i in keystone glance nova cinder neutron; do
  mkdir -p /var/log/"$i"
  ln -s $(docker inspect --format='{{range .Mounts}}{{.Source}}{{end}}' $i)/*.log /var/log/"$i"
done
#ln -s $(docker inspect --format='{{range .Mounts}}{{.Source}}{{end}}' c-vol)/*.log /var/log/cinder
mkdir /var/log/apache2
ln -s $(docker inspect --format='{{range .Mounts}}{{.Source}}{{end}}' horizon)/*.log /var/log/apache2