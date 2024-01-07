FROM python:3.11.7-bookworm

# install ansible
RUN pip install --no-cache-dir ansible

# setup ssh
COPY ./setup_ansible.sh /root/ansible_workspace/
COPY ./id_rsa /root/.ssh/id_rsa
COPY ./id_rsa.pub /root/.ssh/id_rsa.pub

RUN chmod u+x /root/ansible_workspace/setup_ansible.sh && \
  chmod 700 /root/.ssh/id_rsa

# install tools
RUN apt update && \
  apt install -y --no-install-recommends iputils-ping net-tools vim jq

WORKDIR /root/ansible_workspace/
