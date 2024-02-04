# 개요
* ansible collection mysql을 사용하여 mysql 계정을 생성

# 준비
* docker로 mysql 컨테이너 생성

```sh
docker run --name mysql  --rm -e MYSQL_ROOT_PASSWORD=root -e MYSQL_ROOT_PASSWORD=password1234 -p 3306:3306 -d mysql:8.3.0
```

# 실행방법

* playbook 실행
```sh
ansible-playbook playbook.yaml
```

* 계정 확인

```sh
docker exec -it mysql mysql -uroot -ppassword1234 -e "SELECT user,host FROM mysql.user;"
```


# 참고자료
* https://galaxy.ansible.com/ui/standalone/roles/geerlingguy/mysql/install/
