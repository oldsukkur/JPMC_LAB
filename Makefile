### Generic Variables
AVD_VERSION?=4.10.0
LIMIT_ARGS?=
PYTHON?=$(shell which python3)
VENV_PATH:=.venv
VENV_BIN_PATH:=$(VENV_PATH)/bin
VENV_PYTHON:=$(VENV_BIN_PATH)/python
ANSIBLE_VAULT_PASSWORD_FILE ?= ./.vault_passwd
FABRIC_NAME ?= CAMPUS_GLOBAL


REQUIREMENTS:=requirements.txt
ifeq ("$(wildcard $(REQUIREMENTS))","")
	REQUIREMENTS:=.avd/requirements-$(AVD_VERSION).txt
endif

COLLECTION_REQUIREMENTS:=collection-requirements.yml
ifeq ("$(wildcard $(COLLECTION_REQUIREMENTS))","")
	COLLECTION_REQUIREMENTS:=.avd/collection-requirements-$(AVD_VERSION).yml
endif

.PHONY: help
help: ## Display help message (*: main entry points / []: part of an entry point)
	@grep -E '^[0-9a-zA-Z_-]+\.*[0-9a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

.PHONY: build-skip-doc
build-skip-doc: ## Run ansible playbook to build fabric configuration files locally skiping docs
	$(VENV_BIN_PATH)/ansible-playbook playbooks/fabric-deploy.yml -i inventory/inventory.yml --skip-tags documentation --vault-password-file .vault_passwd --tags build $(LIMIT_ARGS)

.PHONY: build-docs
build-docs: build## Build docs and mkdocs
	$(VENV_BIN_PATH)/mkdocs build

.PHONY: build
build: ## Run ansible playbook to build fabric configuration
	$(VENV_BIN_PATH)/ansible-playbook playbooks/fabric-deploy.yml --tags build --vault-password-file .vault_passwd -i inventory/inventory.yml $(LIMIT_ARGS)

.PHONY: build-pyavd
build-pyavd: ## Run pyavd build
	$(VENV_BIN_PATH)/pyavd-build -i inventory/inventory.yml -o inventory/intended -l all,!CVP -f $(FABRIC_NAME) $(LIMIT_ARGS) -v

.PHONY: provision
provision: ## Run ansible playbook to deploy fabric configuration files to CVP
	$(VENV_BIN_PATH)/ansible-playbook playbooks/fabric-deploy.yml --tags provision --vault-password-file .vault_passwd -i inventory/inventory.yml

$(VENV_PYTHON):
	$(PYTHON) -m venv $(VENV_PATH)
	$(VENV_PYTHON) -m pip install --upgrade pip

.PHONY: install-deps
install-deps: $(VENV_PYTHON) ## Install required dependencies
	$(VENV_PYTHON) -m pip install -q -e . -r $(REQUIREMENTS)
	$(VENV_BIN_PATH)/ansible-galaxy install -r $(COLLECTION_REQUIREMENTS)

.PHONY: pre-commit-install
pre-commit-install: ## Install pre-commit hooks
	$(VENV_BIN_PATH)/pre-commit install

.PHONY: pre-commit-run
pre-commit-run: ## Run pre-commit hooks on all files
	$(VENV_BIN_PATH)/pre-commit run --all-files --show-diff-on-failure

.PHONY: freeze
freeze:  ## Freeze requirements
	$(VENV_BIN_PATH)/pip-compile -q --strip-extras .avd/requirements-$(AVD_VERSION).txt -o requirements.txt
	cp .avd/collection-requirements-$(AVD_VERSION).yml collection-requirements.yml

ifndef NO_AUTO_INSTALL_DEPS
build: install-deps
build-docs: install-deps
build-skip-doc: install-deps
build-pyavd: install-deps
upload-cvp: install-deps
deploy-cvp: install-deps
pre-commits: install-deps
endif
