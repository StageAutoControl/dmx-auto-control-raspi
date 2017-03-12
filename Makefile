env ?= pi

.PHONY: check apply

install:
	ansible-galaxy install -r requirements.yml -p roles-lib --force

apply:
	ansible-playbook pi.yml -i inventories/$(env).ini

#
# view-passwords:
# 	ansible-vault view passwords.yml
#
# edit-passwords:
# 	ansible-vault edit passwords.yml
#
check:
	ansible-playbook pi.yml -i inventories/$(env).ini --check

ping:
	ansible pi -i inventories/$(env).ini -m ping

list:
	ansible-playbook pi.yml -i inventories/$(env).ini --list-hosts

dump:
	ansible pi -i inventories/$(env).ini -m setup > /dev/null


