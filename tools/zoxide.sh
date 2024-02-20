#!/bin/bash

cd "$HOME"

sudo curl -sS https://raw.githubusercontent.com/ajeetdsouza/zoxide/main/install.sh > "zoxide_setup.sh"

sudo chmod +x "zoxide_setup.sh"

sudo echo "eval '$(zoxide init --cmd cd bash)'" >> ".bashrc"

echo "Successfully installed Zoxide..."
