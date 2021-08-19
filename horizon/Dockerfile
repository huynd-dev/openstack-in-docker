FROM docker-registry.vccloud.vn/ubuntu:14.04.kilo-base

# Main packages installation.
RUN \
  apt-get update && \
  apt-get install -y --force-yes openstack-dashboard apache2 libapache2-mod-wsgi \
                     memcached python-memcache python-mysqldb && \
  apt-get purge -y openstack-dashboard-ubuntu-theme && \
  a2enmod wsgi && a2enconf openstack-dashboard && \
  apt-get clean && \
  rm -rf /var/lib/apt/lists/*

# Define mountable directories.
VOLUME /var/log/apache2

# Supervisord configuration.
COPY apache2.conf /etc/supervisor/conf.d/
