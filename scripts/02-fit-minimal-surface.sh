#!/usr/bin/env bash
set -e

script_dir=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
cd "$script_dir/.."

for boundary_config in hopf borromean trefoil; do
    poetry run python scripts/train_minimal.py \
           --boundary "$boundary_config" \
           --out "out/minimal-surface-$boundary_config-$i"
done
