FROM docker-registry.vccloud.vn/ubuntu:14.04.kilo-base

# Main packages installation.
RUN \
  apt-get update && \
  apt-get install -y python-keystoneclient python-glanceclient python-novaclient \
                     python-neutronclient python-cinderclient python-heatclient && \
  apt-get clean && \
  rm -rf /var/lib/apt/lists/*