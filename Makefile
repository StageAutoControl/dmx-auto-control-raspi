install:
	 ansible-galaxy install -r requirements.yml
apply:
	ansible-playbook -i stage-auto-control.ini stage-auto-control.yml
