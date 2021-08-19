FROM docker-registry.vccloud.vn/ubuntu:14.04.kilo-base

# Main packages installation.
RUN \
  wget -q -O- 'https://git.ceph.com/release.asc' | apt-key add - && \
  echo "deb http://ceph.com/debian-hammer/ trusty main" > \
        /etc/apt/sources.list.d/ceph.list && \
  apt-get update && \
  apt-get install -y ceph-common python-rbd

RUN \
  apt-get update && \
  apt-get install -y cinder-api cinder-scheduler cinder-backup cinder-volume python-cinderclient python-mysqldb && \
  apt-get clean && \
  rm -rf /var/lib/apt/lists/*

# Define mountable directories.
VOLUME /var/log/cinder

# Supervisord configuration.
COPY cinder.conf /etc/supervisor/conf.d/
