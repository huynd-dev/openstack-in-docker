FROM docker-registry.vccloud.vn/ubuntu:14.04.kilo-base

# Main packages installation.
RUN \
  apt-get update && \
  apt-get install -y neutron-server neutron-plugin-ml2 python-neutronclient \
                     python-neutron-lbaas python-mysqldb && \
  apt-get clean && \
  rm -rf /var/lib/apt/lists/*

# Define mountable directories.
VOLUME /var/log/neutron

# Supervisord configuration.
COPY neutron.conf /etc/supervisor/conf.d/
