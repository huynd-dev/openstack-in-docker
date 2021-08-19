FROM docker-registry.vccloud.vn/ubuntu:14.04.kilo-base

# Main packages installation.
RUN \
  apt-get update && \
  apt-get install -y nova-api nova-cert nova-conductor nova-consoleauth nova-novncproxy \
                     nova-scheduler python-novaclient python-mysqldb && \
  apt-get clean && \
  rm -rf /var/lib/apt/lists/*

# Define mountable directories.
VOLUME /var/log/nova

# Supervisord configuration.
COPY nova.conf /etc/supervisor/conf.d/
