#!/usr/bin/env bash
set -e

script_dir=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
cd "$script_dir/.."


for model_file in out/model/*.pth; do
    name=$(basename "$model_file")
    name=${name%.pth}
    poetry run python scripts/render_current.py \
           --infile "$model_file" \
           --outfile "out/gif/$name.git"
done
