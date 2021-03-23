MAKEFLAGS += --warn-undefined-variables
SHELL := /bin/bash
ifeq ($(word 1,$(subst ., ,$(MAKE_VERSION))),4)
.SHELLFLAGS := -eu -o pipefail -c
endif
.DEFAULT_GOAL := .build
.ONESHELL:



install:
	brew install mhristof/dot/files

.PHONY: help
help: ## Show this help.
	@grep '.*:.*##' Makefile | grep -v grep  | sort | sed 's/:.* ##/:/g' | column -t -s:

IMAGE := homebrew-dot
build: .build
.PHONY: build

.build: Dockerfile
	docker build -t $(IMAGE) .
	touch .build

bash: .build
	docker run --rm -it $(IMAGE) /bin/bash
.PHONY: bash

run: .build
	docker run --rm \
		-v $(PWD):/home/user/.brew/Library/Taps/mhristof/homebrew-dot:ro \
		-v $(PWD):/work:ro -w /work -it $(IMAGE)
.PHONY: run

clean:
	rm -rf .build
.PHONY: clean

