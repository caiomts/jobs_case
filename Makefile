.PHONY: install format

install:
	python -m venv .venv
	. .venv/bin/activate && \
	python -m pip install -U pip && \
	python -m pip install -U flit


