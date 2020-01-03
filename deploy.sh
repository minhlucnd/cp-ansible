#!/bin/sh
state_file_name="terraform.tfstate"

(cd ./terraform/gcp/ && terraform apply -auto-approve)
(cd ./terraform/gcp/ && terraform state pull) > ${state_file_name}
./terraform.py ${state_file_name} > hosts.yml
ansible -i hosts.yml all -m ping
rm ${state_file_name}
ansible-playbook -i hosts.yml all.yml 
