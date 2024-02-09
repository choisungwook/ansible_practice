# syntax=docker/dockerfile:1.4

FROM rockylinux:9.3

# ADD USER
ARG USERNAME=ansible
ARG USER_UID=1000
ARG USER_GID=$USER_UID

# Create the user
RUN groupadd --gid $USER_GID $USERNAME \
    && useradd --uid $USER_UID --gid $USER_GID -m $USERNAME \
    && dnf install -y sudo \
    && echo $USERNAME ALL=\(root\) NOPASSWD:ALL > /etc/sudoers.d/$USERNAME \
    && chmod 0440 /etc/sudoers.d/$USERNAME

# install tools and setup ssh
RUN <<EOF
dnf install -y yum-utils
dnf install -y python3.9-pip
dnf install -y iputils-ping net-tools vim jq wget
dnf install -y openssh-server

ssh-keygen -q -t rsa -b 2048 -f /etc/ssh/ssh_host_rsa_key -N ''
sed -i 's/^\(UsePAM yes\)/# \1/' /etc/ssh/sshd_config;
EOF


USER $USERNAME

WORKDIR /home/$USERNAME

# setup ssh
COPY --chown=$USERNAME:$USERNAME ./key-pair/id_rsa.pub ./.ssh/authorized_keys

EXPOSE 22

ENTRYPOINT sudo /usr/sbin/sshd -D -e && tail -f /dev/null
