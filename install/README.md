# 개요
* docker-compose를 활용한 ansible 실습환경 구축
* 주의: docker-compose는 학습용도로만 사용하세요. ssh 키가 노출되어 있습니다.

# 실행 방법
* docker-compose up

```bash
docker-compose up -d
```

* ansible-controller 컨테이너에 known_host등록하는 쉘 스크립트 실행

```bash
# ansible managed node 개수
N=3

# 쉘 스크립트 실행
docker-compose exec -it ansible-controller ./setup_ansible.sh ${N}
```

# 테스트
* ansible ping module 실행

```bash
docker-compose exec -it ansible-controller ssh root@ansible-node0 ifconfig
docker-compose exec -it ansible-controller ssh root@ansible-node1 ifconfig
```
