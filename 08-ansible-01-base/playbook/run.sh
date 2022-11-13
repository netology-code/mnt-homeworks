#!/bin/sh
docker start fedora centos7 ubuntu
ansible-playbook -i inventory/prod.yml site.yml --ask-vault-pass
docker stop fedora centos7 ubuntu