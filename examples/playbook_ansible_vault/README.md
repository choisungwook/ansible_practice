# 개요
* ansible-vault 예제

# ansible-vault를 AWS SecretManager에 저장

```sh
aws secretsmanager create-secret --name ansible/password \
  --description "Secrets for ansible-vault descryption" \
  --secret-string file://vault-password.json
```

# playbook 실행 방법

```bash
ansible-playbook  playbook.yaml --vault-password-file ./get-vault-password.sh
```

# 참고자료
* https://qiita.com/watarin/items/4ba944785de2ef27387e
* https://stackoverflow.com/questions/75011597/storing-ansible-vault-password-in-aws-secret-manager-and-using-it-when-required
