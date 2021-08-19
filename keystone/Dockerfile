FROM docker-registry.vccloud.vn/ubuntu:14.04.kilo-base

# Main packages installation.
RUN \
  apt-get update && \
  apt-get install -y keystone memcached python-memcache python-mysqldb && \
  apt-get clean && \
  rm -rf /var/lib/apt/lists/*

# Define mountable directories.
VOLUME /var/log/keystone

# Supervisord configuration.
COPY keystone.conf /etc/supervisor/conf.d/
