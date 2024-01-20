# syntax=docker/dockerfile:1.4

FROM rockylinux:9.3

RUN <<EOF
dnf install -y yum-utils
dnf install -y python3.9-pip
dnf install -y iputils-ping net-tools vim jq wget
dnf install -y openssh-server
dnf clean all
EOF


# install ansible
RUN pip3 install --no-cache-dir ansible

# setup ssh-server and setup
COPY ./id_rsa.pub /root/.ssh/authorized_keys

RUN <<EOF
ssh-keygen -q -t rsa -b 2048 -f /etc/ssh/ssh_host_rsa_key -N ''
sed -i 's/^\(UsePAM yes\)/# \1/' /etc/ssh/sshd_config;
EOF

WORKDIR /root/ansible_workspace/

EXPOSE 22

ENTRYPOINT /usr/sbin/sshd -D -e && tail -f /dev/null
