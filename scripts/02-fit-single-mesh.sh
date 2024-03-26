#!/usr/bin/env bash
set -e

script_dir=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
cd "$script_dir/.."

for i in {0..99}; do
    for category in heads torsos arms forearms hands feet; do
        poetry run python scripts/train_reconstruction.py \
               --data "data/$category" \
               --idx "$i" \
               --out "out/single-mesh-$category-$i"
    done
done
