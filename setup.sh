#!/bin/bash

install() {
  sudo apt-get install -y "$1"
}

update() {
  sudo apt-get update
}

upgrade() {
  sudo apt-get upgrade
}

config_file="$HOME/.bashrc"

third_party_software_dir="$HOME/software"

### Setting up third party software directory

mkdir $third_party_software_dir

### Syncing with latest updates

update && upgrade

### Network requests (Tools)

install "curl wget"

echo "Networking utilities have been successfully installed [curl, wget]"

### Archives (Tools)

install "tar gzip unzip"

echo "Archive utilities have been successfully installed [tar, gzip, unzip]"

### Manuals (Tools)

install "man man-db manpages-dev"

echo "Manuals have been successfully installed [man man-db manpages-dev]"

### Development toolchain (Tools) 

install "git ssh ssh-keygen"

echo "Git toolchain has been successfully installed [git, ssh, ssh-keygen]"

### C/C++ Toolchain (Tools)

install "gcc g++ gdb make cmake"

echo "C/C++ toolchain has been successfully installed [gcc, g++, gdb, make, cmake]"

### GF [GDB Frontend] (Tools)

install "x11lib-dev python3 python3-venv"

echo "GF dependencies have been successfully installed [X11, python3, python3-venv]"

git clone https://github.com/nakst/gf.git $third_party_software_dir/gf

bash $third_party_software_dir/gf/build.sh

echo "GF has been successfully installed"

### Neovim [Superior text editor] (Tools)

cd $third_party_software_dir

curl -LO https://github.com/neovim/neovim/releases/download/stable/nvim-linux64.tar.gz

tar xzvf nvim-linux64.tar.gz

mv nvim-linux64 nvim

rm nvim-linux64.tar.gz

ln -s /usr/local/nvim/bin/nvim /usr/local/bin/nvim

echo "Neovim has been successfully installed"

### Fuzzy finder [File search extension] (Terminal)

git clone --depth 1 https://github.com/junegunn/fzf.git "$third_party_software_dir/fzf"

bash "$third_party_software_dir/fzf/install"

echo "Fuzzy finder has been successfully installed"

### Zoxide [Better terminal navigation] (Terminal)

curl -sS https://raw.githubusercontent.com/ajeetdsouza/zoxide/main/install.sh | bash

eval "$(zoxide init --cmd cd bash)" >> $config_file

echo "Zoxide has been successfully installed"

### Sync config file with the changes

source $config_file
