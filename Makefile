create-ssh:
	ssh-keygen -t rsa -f ./id_rsa -N ""


# NOTE: make update-ssh-gcp PROJECT_ID=your-project-id
upload-ssh-gcp:
	gcloud compute os-login ssh-keys add --key-file=./id_rsa.pub --project=$(PROJECT_ID) --ttl=0

# NOTE: make connect-ssh-gcp PROJECT_ID=your-project-id ZONE=your-zone INSTANCE_NAME=your-instance-name
connect-ssh-gcp:
	gcloud compute ssh $(INSTANCE_NAME) --project=$(PROJECT_ID) --zone=$(ZONE) --key-file=./id_rsa.pub


start-playbook:
	ansible-playbook -i inventory.ini playbook.yml