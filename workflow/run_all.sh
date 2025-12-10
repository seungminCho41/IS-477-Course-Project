#!/usr/bin/env bash
set -e

# Move to the project root directory
cd "$(dirname "$0")/.."

# Execute final_notebook notebook
jupyter nbconvert --to notebook --execute notebooks/final_notebook.ipynb --inplace

# Execute Visualizations notebook
jupyter nbconvert --to notebook --execute notebooks/Visualizations.ipynb --inplace
