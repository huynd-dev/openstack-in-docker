FROM ubuntu:14.04
MAINTAINER Nguyen Manh Linh <linhnm@vccloud.vn>

# SSH configuration.
RUN  mkdir /var/run/sshd /root/.ssh
COPY authorized_keys /root/.ssh/

# Define working directory.
WORKDIR /root

# Set timezone
RUN  ln -sf /usr/share/zoneinfo/Asia/Ho_Chi_Minh /etc/localtime

# Repo and common packages.
RUN \
  sed -i s/archive.ubuntu.com/mirror.vccloud.vn/g /etc/apt/sources.list && \
  apt-get update && \
  apt-get install -y byobu haproxy openssh-server supervisor vim wget

# Define default command.
CMD ["/usr/bin/supervisord", "-n"]

# Supervisord configuration.
COPY common.conf /etc/supervisor/conf.d/