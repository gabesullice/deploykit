hosts=../settings/hosts

devplay=../settings/dev.yml
stgplay=../settings/dev.yml
prdplay=../settings/dev.yml

ROLES_PATH=$(shell pwd)/roles

flags=--ask-become-pass

env_set=export ANSIBLE_ROLES_PATH=$(ROLES_PATH)

launch.prd:
	$(env_set) && \
		ansible-playbook $(flags) -i $(hosts) -t launch $(prdplay)

launch.dev:
	$(env_set) && \
		ansible-playbook $(flags) -i $(hosts) -t launch $(devplay)

deploy.prd:
	$(env_set) && \
		ansible-playbook $(flags) -i $(hosts) -t "deploy,release" $(prdplay)

deploy.dev:
	$(env_set) && \
		ansible-playbook $(flags) -i $(hosts) -t "deploy,release" $(devplay)

setup.prd:
	$(env_set) && \
		ansible-playbook $(flags) -i $(hosts) -t setup $(prdplay)

setup.dev:
	$(env_set) && \
		ansible-playbook $(flags) -i $(hosts) -t setup $(devplay)

revert.prd:
	$(env_set) && \
		ansible-playbook $(flags) -i $(hosts) -t revert $(prdplay)

revert.dev:
	$(env_set) && \
		ansible-playbook $(flags) -i $(hosts) -t revert $(devplay)
