FROM docker-registry.vccloud.vn/ubuntu:14.04.kilo-base

# Main packages installation.
RUN \
  apt-get update && \
  apt-get install -y heat-api heat-api-cfn heat-engine python-heatclient python-mysqldb && \
  apt-get clean && \
  rm -rf /var/lib/apt/lists/*

# Define mountable directories.
VOLUME /var/log/heat

# Supervisord configuration.
COPY heat.conf /etc/supervisor/conf.d/
