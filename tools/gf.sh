#!/bin/bash

install "libx11-dev"

install "python3"

install "python3-venv"

mkdir -p "$HOME/software"

sudo git clone --depth 1 "https://github.com/nakst/gf.git" "$HOME/software/gf"

. "$HOME/software/gf/build.sh"
