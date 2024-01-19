# 개요
* ansible playbook 변수 예제

# 예제 목차
* [key-value](./playbook_key_value.yaml)
* [list](./playbook_list.yaml)
* [file을 사용](./playbook_file.yaml)

# playbook 실행 방법

```bash
ansible-playbook {예제 파일}
```

# 변수 오버라이딩 예제 실행 방법

```bash
ansible-playbook playbook_file.yaml -e "hello=qwer"
ansible-playbook playbook_file.yaml -e "@override_vars.yaml"
```

# 참고자료
* https://docs.ansible.com/ansible/latest/playbook_guide/playbooks_error_handling.html
