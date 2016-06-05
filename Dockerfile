FROM centos:7

RUN yum -y install openssh-server epel-release docker && \
    yum install -y pwgen supervisor nano nmap && \
    rm -f /etc/ssh/ssh_host_ecdsa_key /etc/ssh/ssh_host_rsa_key && \
    ssh-keygen -q -N "" -t dsa -f /etc/ssh/ssh_host_ecdsa_key && \
    ssh-keygen -q -N "" -t rsa -f /etc/ssh/ssh_host_rsa_key && \
    sed -i "s/#UsePrivilegeSeparation.*/UsePrivilegeSeparation no/g" /etc/ssh/sshd_config

ADD set_root_pw.sh /set_root_pw.sh
ADD run.sh /run.sh
RUN chmod +x /*.sh

COPY supervisord.conf /supervisord.conf

ENV AUTHORIZED_KEYS **None**

EXPOSE 22


# Define additional metadata for our image.
VOLUME /var/lib/docker

CMD ["/run.sh"]
