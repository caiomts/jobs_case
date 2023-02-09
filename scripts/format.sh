#!/usr/bin/env bash

set -x
set -e

python -m black jobs tests
python -m flake8 jobs tests
python -m isort jobs tests