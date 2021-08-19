#!/bin/bash

LAN_IP=172.30.3.15
code_name=iron
node_number=4

keystone=keystone:2015.1.4
glance=glance:2015.1.4
nova=nova:2015.1.4
neutron=neutron-server:2015.1.4
cinder=cinder:2015.1.4
horizon=horizon:2015.1.4
heat=heat:2015.1.4
admin=admin:2015.1.4
base=ubuntu:14.04.kilo-base

cat > docker-compose.yml << EOF
version: '2'

services:
  base:
    build: ./base
    image: docker-registry.vccloud.vn/$base

  admin:
    build: ./admin
    image: docker-registry.vccloud.vn/$admin
    ports:
      - "$LAN_IP:2211:22"

  keystone:
    build: ./keystone
    image: docker-registry.vccloud.vn/$keystone
    hostname: $code_name-keystone-$node_number
    restart: always
    privileged: true
    ports:
      - "$LAN_IP:5000:5000"
      - "$LAN_IP:35357:35357"
      - "$LAN_IP:2212:22"
    container_name: keystone

  glance:
    build: ./glance
    image: docker-registry.vccloud.vn/$glance
    hostname: $code_name-glance-$node_number
    restart: always
    privileged: true
    ports:
      - "$LAN_IP:9191:9191"
      - "$LAN_IP:9292:9292"
      - "$LAN_IP:2213:22"
    container_name: glance

  nova:
    build: ./nova
    image: docker-registry.vccloud.vn/$nova
    hostname: $code_name-nova-$node_number
    restart: always
    privileged: true
    ports:
      - "$LAN_IP:8773:8773"
      - "$LAN_IP:8774:8774"
      - "$LAN_IP:8775:8775"
      - "$LAN_IP:6080:6080"
      - "$LAN_IP:2214:22"
    container_name: nova

  neutron:
    build: ./neutron
    image: docker-registry.vccloud.vn/$neutron
    hostname: $code_name-neutron-$node_number
    restart: always
    privileged: true
    ports:
      - "$LAN_IP:9696:9696"
      - "$LAN_IP:2215:22"
    container_name: neutron

  cinder:
    build: ./cinder
    image: docker-registry.vccloud.vn/$cinder
    hostname: $code_name-cinder-$node_number
    restart: always
    privileged: true
    ports:
      - "$LAN_IP:8776:8776"
      - "$LAN_IP:2216:22"
    container_name: cinder

  horizon:
    build: ./horizon
    image: docker-registry.vccloud.vn/$horizon
    hostname: $code_name-horizon-$node_number
    restart: always
    privileged: true
    ports:
      - "$LAN_IP:80:80"
      - "$LAN_IP:443:443"
      - "$LAN_IP:2217:22"
    container_name: horizon

  heat:
    build: ./heat
    image: docker-registry.vccloud.vn/$heat
    hostname: $code_name-heat-$node_number
    restart: always
    privileged: true
    ports:
      - "$LAN_IP:8000:8000"
      - "$LAN_IP:8004:8004"
      - "$LAN_IP:2218:22"
    container_name: heat
EOF
