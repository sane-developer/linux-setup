#!/bin/bash

install() {
  sudo apt-get install -q -y "$1" > /dev/null 2>&1
  
  if [ $? -eq 0 ]; then
    echo "Successfully installed $1"
  fi
}

update() {
  sudo apt-get update > /dev/null 2>&1
 
  if [ $? -eq 0 ]; then
    echo "Successfully updated package information"
  fi
}

upgrade() {
  sudo apt-get upgrade -y > /dev/null 2>&1
  
  if [ $? -eq 0 ]; then
    echo "Successfully upgraded installed packages"
  fi
}

### Syncing with latest updates

update
upgrade

### Package manager tools 

install "man"
install "man-db"
install "manpages-dev"

install "tar"
install "gzip"
install "unzip"

install "curl"
install "wget"

install "git"
install "ssh"
install "ssh-keygen"

install "gcc"
install "g++"
install "gdb"
install "make"
install "cmake"

install "libx11-dev"
install "python3"
install "python3-venv"

### Manual installation tools

./tools/gf.sh
./tools/nvim.sh
./tools/fzf.sh
./tools/zoxide.sh

### Adjust the .bashrc configuration file

config_file="$HOME/.bashrc"

echo "alias ls='LC_COLLATE=C ls -la --color=auto --group-directories-first'" >> "$config_file"
echo "export PATH=$PATH:$HOME/software/gf:$HOME/software/nvim/bin:$HOME/.local/bin" >> "$config_file"
echo "export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'" >> "$config_file"

source "$config_file"
