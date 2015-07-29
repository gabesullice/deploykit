hosts=../settings/hosts

devplay=../settings/dev.yml
stgplay=../settings/dev.yml
prdplay=../settings/dev.yml

ROLES_PATH=$(shell pwd)/roles

flags=--ask-become-pass

env_set=export ANSIBLE_ROLES_PATH=$(ROLES_PATH)

#####################
#### Development ####
#####################

setup.dev:
	$(env_set) && \
		ansible-playbook $(flags) -i $(hosts) -t setup $(devplay)

deploy.dev:
	$(env_set) && \
		ansible-playbook $(flags) -i $(hosts) -t "deploy,release" $(devplay)

launch.dev:
	$(env_set) && \
		ansible-playbook $(flags) -i $(hosts) -t launch $(devplay)

revert.dev:
	$(env_set) && \
		ansible-playbook $(flags) -i $(hosts) -t revert $(devplay)

itall.dev:
	$(env_set) && \
		ansible-playbook $(flags) -i $(hosts) -t "setup,deploy,release,launch" $(devplay)

#################
#### Staging ####
#################

setup.stg:
	$(env_set) && \
		ansible-playbook $(flags) -i $(hosts) -t setup $(stgplay)

deploy.stg:
	$(env_set) && \
		ansible-playbook $(flags) -i $(hosts) -t "deploy,release" $(stgplay)

launch.stg:
	$(env_set) && \
		ansible-playbook $(flags) -i $(hosts) -t launch $(stgplay)

revert.stg:
	$(env_set) && \
		ansible-playbook $(flags) -i $(hosts) -t revert $(stgplay)

itall.stg:
	$(env_set) && \
		ansible-playbook $(flags) -i $(hosts) -t "setup,deploy,release,launch" $(stgplay)

####################
#### Production ####
####################

setup.prd:
	$(env_set) && \
		ansible-playbook $(flags) -i $(hosts) -t setup $(prdplay)

deploy.prd:
	$(env_set) && \
		ansible-playbook $(flags) -i $(hosts) -t "deploy,release" $(prdplay)

launch.prd:
	$(env_set) && \
		ansible-playbook $(flags) -i $(hosts) -t launch $(prdplay)

revert.prd:
	$(env_set) && \
		ansible-playbook $(flags) -i $(hosts) -t revert $(prdplay)

itall.prd:
	$(env_set) && \
		ansible-playbook $(flags) -i $(hosts) -t "setup,deploy,release,launch" $(prdplay)
