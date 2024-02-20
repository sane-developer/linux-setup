#!/bin/bash

install "libx11-dev"

install "python3"

install "python3-venv"

mkdir -p "$HOME/software"

clone "https://github.com/nakst/gf.git" "$HOME/software/gf"

run "$HOME/software/gf/build.sh"