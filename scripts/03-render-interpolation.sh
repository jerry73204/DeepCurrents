#!/usr/bin/env bash
set -e

script_dir=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
cd "$script_dir/.."


for category in heads torsos arms forearms hands; do
    for interpolation_type in latent boundary; do
        for model_file in out/model/*.pth; do
            name=$(basename "$model_file")
            name=${name%.pth}
            poetry run python scripts/render_interpolation.py \
                   --infile "$model_file" \
                   --outfile "out/gif/$name.git"
                   --data "data/$category" \
                   --interpolation_type "$interpolation_type"
        done
    done
done
