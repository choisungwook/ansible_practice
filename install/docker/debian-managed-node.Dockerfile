FROM python:3.11.7-bookworm

# install ansible
RUN pip install --no-cache-dir ansible

# install tools
RUN apt update && \
  apt install -y --no-install-recommends iputils-ping net-tools vim

# install ssh-server and setup
RUN apt install openssh-server -y && \
  mkdir -p ~/.ssh && \
  echo "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQDtGdkvsvCw8dAXajur7B4d/wj4FAJqQPPlYiBxrXjlZyLgK6wOuZGnvuVZ4rZ4+JUo6m7R9BzaQkLXmeSAslylVDV5/nbR8O18LEmrigLIJ1dd3UBS6h3hPZyWYS8PXQygvjE44zcWNFbQOJPsTdHQ+mFdcV7IuEOk9EqFZ86ywdYfYm7qDb1FHOE7kw+A51rzGJtI5cLqN0kSg7u9iagKxngA0nG9SWCwooHPL+k8ajUWcumwjYL38m0uDXRYR2JIlLegH1EwulzXf3ykDPe5bTOQaz8Jb9jn+hnRKxM/UJ5A+Bxt00W77y0xkZx8l6PrPQtcyAZIAsHRZ8bQUV4fMQXfSMf/ikP8q6mrhAEju38ceG2QfjZGcYeKjIwr4t+dLYLSoJ35uu6ShwmetWGaBLOXMpBp1zrMRLa0fEbmBh5MHakQfvfeg9hvoVCvKL45NnYL/s1Wo6uJHsr+6MHMwNz67d/GIY0lU44mkBQdNoS7R4P2BKZ6xJBBxQ/eDmFOyijBlTdZAMRMBbm2DppTr8JYmNQhLdZRYaQ/rfKKWvVGj+kI7MUWBm5YM8fzbo/NxldEoIdu6y198aSoAdPFrnUZqqJZa16vuVA8ekjuJTjQnfiuj4htPaVN5mMPljKg4NsJbITf62URQ2iBe6Q9+LNRLNopJe4gCBh4DzGd+w== root@ansible-controller" > ~/.ssh/authorized_keys

WORKDIR /ansible_workspace

EXPOSE 22

ENTRYPOINT service ssh start && tail -f /dev/null
