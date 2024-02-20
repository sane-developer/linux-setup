#!/bin/bash

mkdir -p "$HOME/software/"

cd "$HOME/software/"

sudo curl -LO https://github.com/neovim/neovim/releases/download/stable/nvim-linux64.tar.gz 

sudo tar xzvf nvim-linux64.tar.gz

sudo mv nvim-linux64 nvim

sudo rm nvim-linux64.tar.gz

echo "Neovim has been successfully installed"
