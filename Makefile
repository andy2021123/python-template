ifeq ($(OS),Windows_NT)
	REMOVE_VENV := if exist ".venv" (rmdir /s /q .venv)
	ACTIVATE := .venv\Scripts\activate
	NEWLINE := echo.
else
	REMOVE_VENV := rm -rf .venv
	ACTIVATE := source .venv/bin/activate
	NEWLINE := echo
endif

.PHONY: virtualenv install

virtualenv:
	@$(REMOVE_VENV)
	@python -m venv .venv
	@$(NEWLINE)
	@echo Activate the virtual environment with:
	@echo $(ACTIVATE)

install:
	pip install -e .