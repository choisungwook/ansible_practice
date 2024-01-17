#!/bin/sh
aws secretsmanager get-secret-value --secret-id ansible/password | jq -r .SecretString | jq -r .ansible_vault_password
