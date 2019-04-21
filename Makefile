install:
	 ansible-galaxy install -r requirements.yml

apply:
	ansible-playbook -i stage-auto-control.ini stage-auto-control.yml

sync-storage:
	ansible-playbook -i stage-auto-control.ini sync-storage.yml
