FROM python:3.11.7-bookworm

# install ansible
RUN pip install --no-cache-dir ansible

# install tools
RUN apt update && \
  apt install -y --no-install-recommends iputils-ping net-tools vim

# setup ssh
COPY ./setup_ansible.sh /ansible_workspace/
RUN ssh-keygen -t rsa -b 4096 -f ~/.ssh/id_rsa -N "" && \
  chmod u+x /ansible_workspace/setup_ansible.sh

WORKDIR /ansible_workspace
