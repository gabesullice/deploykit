hosts=hosts
flags=--ask-become-pass

launch.prd:
	ansible-playbook $(flags) -i $(hosts) -t launch prd.yml

launch.dev:
	ansible-playbook $(flags) -i $(hosts) -t launch dev.yml

deploy.prd:
	ansible-playbook $(flags) -i $(hosts) -t "deploy,release" prd.yml

deploy.dev:
	ansible-playbook $(flags) -i $(hosts) -t "deploy,release" dev.yml

setup.prd:
	ansible-playbook $(flags) -i $(hosts) -t setup prd.yml

setup.dev:
	ansible-playbook $(flags) -i $(hosts) -t setup dev.yml

revert.prd:
	ansible-playbook $(flags) -i $(hosts) -t revert prd.yml

revert.dev:
	ansible-playbook $(flags) -i $(hosts) -t revert dev.yml
