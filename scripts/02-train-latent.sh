#!/usr/bin/env bash
set -e

script_dir=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
cd "$script_dir/.."

for category in heads torsos arms forearms hands; do
    poetry run python \
           scripts/train_latent.py \
           --data "data/$category" \
           --out "out/train-latent-$category-$i"
done
