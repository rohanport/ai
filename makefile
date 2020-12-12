# Usage:
# install 	- Installs package and all required dependencies
# run 		- Runs models

.ONESHELL:
SHELL := /bin/bash
VENV ?= false
render ?= false
model ?= basic-reinforcement
prog ?= install 

.PHONY: all
all:
ifeq ($(VENV), true)
	if [ ! -d "venv" ]; then python3 -m venv venv; fi
	source venv/bin/activate && $(MAKE) $(prog) && deactivate
else
	$(MAKE) $(prog)
endif

#############################################################################

.PHONY: run
run:
ifeq ($(render), true)
	export DISPLAY=localhost:0
	export RENDER_ENV=true
endif
	python models/$(model)/$(model).py

#############################################################################

.PHONY: installRequirements
installRequirements:
	python -m pip install --upgrade pip
	pip install -r "requirements.txt"

.PHONY: install
install: installRequirements

#############################################################################

.PHONY: pip-install
pip-install:
	pip install $(dep)

.PHONY: update-requirements
update-requirements:
	pip freeze | grep -v "pkg-resources" > requirements.txt

.PHONY: add
add: pip-install update-requirements