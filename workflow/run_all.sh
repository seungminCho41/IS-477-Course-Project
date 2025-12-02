#!/usr/bin/env bash
set -e

cd "$(dirname "$0")/.."

jupyter nbconvert --to notebook --execute notebooks/final_notebook.ipynb --inplace
