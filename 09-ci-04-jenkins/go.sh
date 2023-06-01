#!/usr/bin/env bash

workdir=./infrastructure

if ! [ -x "$(command -v terraform)" ]; then
  echo 'Terraform is not installed. Visit: https://hashicorp-releases.yandexcloud.net/terraform/' >&2
  exit 1
fi

if ! [ -x "$(command -v yc)" ]; then
  echo 'Yandex CLI is not installed. Visit: https://cloud.yandex.ru/docs/cli/quickstart' >&2
  exit 2
fi

if [ ! -d $workdir ]; then
  echo "Infrastructure files not exists"
  exit 3
fi

export TF_VAR_YC_TOKEN=$(yc config get token)
export TF_VAR_YC_CLOUD_ID=$(yc config get cloud-id)
export TF_VAR_YC_FOLDER_ID=$(yc config get folder-id)
export TF_VAR_YC_ZONE=$(yc config get compute-default-zone)

init() {
    terraform init
}

up() {
    terraform apply --auto-approve
}

down() {
    terraform destroy --auto-approve
}

clear() {
    rm -rf .terraform*
    rm terraform.tfstate*
}

deploy() {
    ansible-playbook -i cicd site.yml
    yc compute instance list
}

cd $workdir

if [ $1 ]; then
    $1
else
    echo "Possible commands:"
    echo "  init - Init terraform provider"
    echo "  up - Deplay cloud resources"
    echo "  down - Destroy all cloud resources"
    echo "  clear - Clear temporary files"
    echo "  deploy - Deploy Jenkins nodes"
fi
