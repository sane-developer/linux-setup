#!/bin/bash

mkdir -p "$HOME/software"

sudo git clone --depth 1 "https://github.com/nakst/gf.git" "$HOME/software/gf"

. "$HOME/software/gf/build.sh"
