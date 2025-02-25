.PHONY: create-venv install-deps lint format

# Create virtual environment only if .venv doesn't exist
create-venv:
	@if [ ! -d ".venv" ]; then \
		if ! python3 -m venv --help >/dev/null 2>&1; then \
			echo "Python venv module not available. Please install Python with venv support."; \
			exit 1; \
		fi; \
		python3 -m venv .venv; \
	fi

install-deps:
	@if command -v pip >/dev/null 2>&1; then \
		pip install yamllint yamlfix pre-commit; \
		pre-commit install; \
	else \
		echo "Pip not found or not running with venv. Please run \`make create-venv\` first."; \
		exit 1; \
	fi

lint:
	@if [ -z "$$VIRTUAL_ENV" ]; then \
		echo "Please activate Python virtual environment first."; \
		exit 1; \
	fi; \
	yamllint .

format:
	@if [ -z "$$VIRTUAL_ENV" ]; then \
		echo "Please activate Python virtual environment first."; \
		exit 1; \
	fi; \
	yamlfix . --config-file .yamlfix.toml --exclude ".github/**" --exclude ".venv/**" --exclude "venv/**"