.PHONY: default prepare build clean

default:

prepare:


build:
	poetry lock
	poetry install
	poetry build

clean:
	@for name in $$(poetry env list); do \
		poetry env remove $$name; \
	done
