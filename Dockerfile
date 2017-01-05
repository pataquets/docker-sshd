FROM pataquets/ubuntu:xenial

RUN \
  apt-get update && \
  DEBIAN_FRONTEND=noninteractive \
    apt-get install -y \
      openssh-server \
  && \
  apt-get clean && \
  rm -rf /var/lib/apt/lists/* \
  && \
  rm -vf /etc/ssh/ssh_host_* && \
  mkdir -v /var/run/sshd

ADD ./docker-run /root/docker-run

CMD [ "/root/docker-run" ]
