#!/usr/bin/env bash
set -euo pipefail

PROJECT_DIR="/home/pi-vault/projects/bilbasen_webscraping"
PY="$PROJECT_DIR/bilbasen_venv/bin/python"

cd "$PROJECT_DIR"
mkdir -p logs output

for fuel in 1 2 3; do
  "$PY" -m papermill \
    "bilbasen webscrape v2.0.ipynb" \
    "output/last_fuel_run_${fuel}.ipynb" \
    -p selected_fuel_type "$fuel" \
    >> "logs/fuel_${fuel}_$(date +\%F).log" 2>&1
done
