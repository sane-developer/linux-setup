#!/bin/bash

mkdir -p "$HOME/software/"

cd "$HOME/software/"

curl -LO https://github.com/neovim/neovim/releases/download/stable/nvim-linux64.tar.gz > /dev/null 2>&1 

tar xzvf nvim-linux64.tar.gz > /dev/null 2>&1

mv nvim-linux64 nvim

rm nvim-linux64.tar.gz

echo "Neovim has been successfully installed"
