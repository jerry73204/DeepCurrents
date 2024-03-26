#!/usr/bin/env bash
set -e

script_dir=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
cd "$script_dir/.."

wget -O - 'https://www.dropbox.com/s/jgm6hfif6evpi2b/faust.tar.gz?dl=0' | tar -xvzf -
poetry run sh ./scripts/generate_data.sh
