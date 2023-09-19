include .env
export $(shell sed 's/=.*//' .env)

tf-init:
	terraform init

tf-plan:
	terraform fmt && \
	terraform validate && \
	terraform plan

tf-apply:
	terraform apply

tf-destroy:
	terraform destroy

ansible-apply:
	ansible-playbook -i ansible/hosts ansible/playbook.yml