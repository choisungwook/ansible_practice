FROM python:3.11.7-bookworm

# install ansible
RUN pip install --no-cache-dir ansible

# install ssh-server and setup
COPY ./id_rsa.pub /root/.ssh/authorized_keys
RUN apt update && apt install openssh-server -y

# install tools
RUN apt install -y --no-install-recommends iputils-ping net-tools vim jq

WORKDIR /root/ansible_workspace/

EXPOSE 22

ENTRYPOINT service ssh start && tail -f /dev/null
