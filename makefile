# Usage:
# install 	- Installs package and all required dependencies
# run 		- Runs models

.ONESHELL:
SHELL := /bin/bash
venv ?= False

.PHONY: all
all:
ifeq ($(venv), true)
	source env/bin/activate && $(MAKE) $(prog) && deactivate
else
	$(MAKE) $(prog)
endif

.PHONY: run
run:
	python models/$(model)/$(model).py

.PHONY: installRequirements
installRequirements:
	pip install -r "requirements.txt"

.PHONY: install
install: installRequirements