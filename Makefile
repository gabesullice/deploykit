hosts=../settings/hosts

flags_default=
flags=$(flags_default)

include ../settings/deploykit.conf

#####################
###### Targets ######
#####################

setup.dev:
	ansible-playbook $(flags) -i $(hosts) $(sudo) -l develop -t setup main.yml
setup.stg:
	ansible-playbook $(flags) -i $(hosts) $(sudo) -l staging -t setup main.yml

deploy.dev:
	ansible-playbook $(flags) -i $(hosts) $(sudo) -l develop -t deploy,release main.yml
deploy.stg:
	ansible-playbook $(flags) -i $(hosts) $(sudo) -l staging -t deploy,release main.yml

launch.dev:
	ansible-playbook $(flags) -i $(hosts) $(sudo) -l develop -t launch main.yml
launch.stg:
	ansible-playbook $(flags) -i $(hosts) $(sudo) -l staging -t launch main.yml

revert.dev:
	ansible-playbook $(flags) -i $(hosts) $(sudo) -l develop -t revert main.yml
revert.stg:
	ansible-playbook $(flags) -i $(hosts) $(sudo) -l staging -t revert main.yml

itall.dev:
	ansible-playbook $(flags) -i $(hosts) $(sudo) -l develop -t "setup,deploy,release,launch" main.yml
itall.stg:
	ansible-playbook $(flags) -i $(hosts) $(sudo) -l staging -t "setup,deploy,release,launch" main.yml
