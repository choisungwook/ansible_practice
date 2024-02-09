FROM python:3.11.7-bookworm

# ADD USER
ARG USERNAME=ansible
ARG USER_UID=1000
ARG USER_GID=$USER_UID

# Create the user
RUN groupadd --gid $USER_GID $USERNAME \
    && useradd --uid $USER_UID --gid $USER_GID -m $USERNAME \
    && apt-get update \
    && apt-get install -y sudo \
    && echo $USERNAME ALL=\(root\) NOPASSWD:ALL > /etc/sudoers.d/$USERNAME \
    && chmod 0440 /etc/sudoers.d/$USERNAME

# install tools
RUN apt update \
    && apt install -y --no-install-recommends iputils-ping net-tools vim jq openssh-server

USER $USERNAME

WORKDIR /home/$USERNAME

# setup ssh
COPY --chown=$USERNAME:$USERNAME ./key-pair/id_rsa.pub ./.ssh/authorized_keys

EXPOSE 22

ENTRYPOINT sudo service ssh start && tail -f /dev/null
