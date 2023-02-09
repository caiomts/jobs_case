.PHONY: setup install format

VPATH = job:data:models:results

pyenv = . .venv/bin/activate &&



train_opt.db model.joblib pipe.joblib select.joblib &: interim/dataset_interim.feather
	$(pyenv) cd notebooks && ipython -c "%run models.ipynb"

interim/dataset_interim.feather : raw/dataset.csv
	$(pyenv) cd notebooks && ipython -c "%run eda.ipynb"

setup:
	python -m venv .venv
	$(pyenv) \
	python -m pip install -U pip && \
	python -m pip install -U flit

install:
	$(pyenv) \
	python -m flit install --symlink --deps all

format:
	$(pyenv) bash scripts/format.sh

requirements:
	$(pyenv) python scripts/requirements.py
