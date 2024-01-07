# 개요
* docker-compose를 활용한 ansible 실습환경 구축
* 주의: docker-compose는 학습용도로만 사용하세요. ssh 키가 노출되어 있습니다.

# 준비
* docker, docker-compose
* docker와 docker-compose 사용방법

# 실행 방법
```bash
docker-compose up -d
```

* ansible-controller 컨테이너에 known_host등록하는 쉘 스크립트 실행
****
```bash
# ansible managed node 개수
N=2

# 쉘 스크립트 실행
docker-compose exec -it ansible-controller ./setup_ansible.sh ${N}
```

# ansible-controller 터미널 접속 방법
* docker 컨테이너 확인

```bash
$ docker-compose ps
NAME                 SERVICE              CREATED         STATUS         PORTS
ansible-controller   ansible-controller   2 minutes ago   Up 2 minutes
ansible-node1        ansible-node0        2 minutes ago   Up 2 minutes   22/tcp
ansible-node2        ansible-node1        2 minutes ago   Up 2 minutes   22/tcp
```

* ansible-controller 컨테이너 터미널 접속

```bash
docker-compose exec -it ansible-controller bash
```

# 테스트
* ansible ping module 실행

```bash
$ docker-compose exec -it ansible-controller bash

# inventory 생성
(ansible-controller container)$ cat <<EOT > inventory
ansible-node0
ansible-node1
EOT

# ping module 실행
(ansible-controller container)$ ansible -i inventory -m ping all
ansible-node1 | SUCCESS => {
  "ansible_facts": {
      "discovered_interpreter_python": "/usr/bin/python3"
  },
  "changed": false,
  "ping": "pong"
}
ansible-node0 | SUCCESS => {
  "ansible_facts": {
      "discovered_interpreter_python": "/usr/bin/python3"
  },
  "changed": false,
  "ping": "pong"
}
```
