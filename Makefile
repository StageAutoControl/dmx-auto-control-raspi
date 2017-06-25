env ?= pi
controller_path ?= "$$(pwd)/../controller/"
definition_files ?= "$${DEFINITION_FILES}"
.PHONY: check apply

install:
	ansible-galaxy install -r requirements.yml -p roles --force

apply:
	ansible-playbook pi.yml \
		-i inventories/$(env).ini \
		-e controller_path=${controller_path} \
		-e definition_files=${definition_files}

check:
	ansible-playbook pi.yml \
		-i inventories/$(env).ini \
		-e controller_path=${controller_path} \
		-e definition_files=${definition_files} \
		--check

ping:
	ansible pi -i inventories/$(env).ini -m ping

list:
	ansible-playbook pi.yml -i inventories/$(env).ini --list-hosts

dump:
	ansible pi -i inventories/$(env).ini -m setup > /dev/null


