DEFAULT: help

.PHONY: help test
help: ## show help message
	@awk 'BEGIN {FS = ":.*##"; printf "\nUsage:\n  make \033[36m\033[0m\n"} /^[$$()% a-zA-Z_-]+:.*?##/ { printf "  \033[36m%-15s\033[0m %s\n", $$1, $$2 } /^##@/ { printf "\n\033[1m%s\033[0m\n", substr($$0, 5) } ' $(MAKEFILE_LIST)

lint: ## code formatting for the project
	black --check humanize

test: ## Run the unit tests
	@pytest -s -v --cov=dehumanize/src \
							  --cov-fail-under 80 \
							  --cov-report term-missing \
							  --cov-report xml