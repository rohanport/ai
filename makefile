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