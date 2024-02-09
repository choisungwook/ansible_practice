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
    && apt install -y --no-install-recommends iputils-ping net-tools vim jq

USER $USERNAME

WORKDIR /home/$USERNAME

# install ansible
RUN pip install --no-cache-dir ansible --user ansible
ENV PATH=$PATH:/home/$USERNAME/.local/bin

# setup ssh
COPY --chown=$USERNAME:$USERNAME --chmod=755 ./setup_ansible.sh ./ansible_workspace/setup_ansible.sh
COPY --chown=$USERNAME:$USERNAME --chmod=700 ./id_rsa ./.ssh/id_rsa
COPY --chown=$USERNAME:$USERNAME ./id_rsa.pub ./.ssh/id_rsa.pub
