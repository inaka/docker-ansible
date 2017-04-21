.PHONY: all build publish

DOCKER         ?= $(shell which docker)
COMPOSE        ?= $(shell which docker-compose)

DKR_REGISTRY   ?= inakaops
DKR_IMAGE      ?= ansible
DKR_TAG        ?= 2.1.1

DKR_BUILD_OPTS ?= -t $(DKR_REGISTRY)/$(DKR_IMAGE):$(DKR_TAG)


build: ## Build docker image
	$(COMPOSE) build

publish: ## Publish docker image to the provided container registry
	$(DOCKER) build $(DKR_BUILD_OPTS) .
	$(DOCKER) push $(DKR_REGISTRY)/$(DKR_IMAGE):$(DKR_TAG)
