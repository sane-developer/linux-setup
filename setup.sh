#!/bin/bash

install() {
  sudo apt-get install -q -y "$1" 2>&1 | tee -a install_log.txt
  
  if [ $? -eq 0 ]; then
    echo "Successfully installed $1"
  else
    echo "Failed to install $1. Check install_log.txt for details."
  fi
}

clone() {
  sudo git clone --depth 1 "$1" "$2" 2>&1 | tee -a clone_log.txt
  
  if [ $? -eq 0 ]; then
    echo "Successfully cloned $1 to $2"
  else
    echo "Failed to clone $1 to $2. Check clone_log.txt for details."
  fi
}

update() {
  sudo apt-get update 2>&1 | tee -a update_log.txt
  
  if [ $? -eq 0 ]; then
    echo "Successfully updated package information"
  else
    echo "Failed to update package information. Check update_log.txt for details."
  fi
}

upgrade() {
  sudo apt-get upgrade -y 2>&1 | tee -a upgrade_log.txt
  
  if [ $? -eq 0 ]; then
    echo "Successfully upgraded installed packages"
  else
    echo "Failed to upgrade installed packages. Check upgrade_log.txt for details."
  fi
}

config_file="$HOME/.bashrc"

third_party_software_dir="$HOME/software"

### Setting up third party software directory

mkdir $third_party_software_dir

### Syncing with latest updates

update

upgrade

### Network requests (Tools)

install "curl"

install "wget"

### Archives (Tools)

install "tar"

install "gzip"

install "unzip"

### Manuals (Tools)

install "man"

install "man-db"

install "manpages-dev"

### Development toolchain (Tools) 

install "git"

install "ssh"

install "ssh-keygen"

### C/C++ Toolchain (Tools)

install "gcc"

install "g++"

install "gdb"

install "make"

install "cmake"

### GF [GDB Frontend] (Tools)

install "x11lib-dev"

install "python3"

install "python3-venv"

clone "https://github.com/nakst/gf.git" "$third_party_software_dir/gf"

source "$third_party_software_dir/gf/build.sh"

echo "GF has been successfully installed"

### Neovim [Superior text editor] (Tools)

cd "$third_party_software_dir"

curl -LO https://github.com/neovim/neovim/releases/download/stable/nvim-linux64.tar.gz

tar xzvf nvim-linux64.tar.gz

mv nvim-linux64 nvim

rm nvim-linux64.tar.gz

ln -s /usr/local/nvim/bin/nvim /usr/local/bin/nvim

echo "Neovim has been successfully installed"

### Fuzzy finder [File search extension] (Terminal)

clone "https://github.com/junegunn/fzf.git" "$third_party_software_dir/fzf"

source "$third_party_software_dir/fzf/install"

echo "Fuzzy finder has been successfully installed"

### Zoxide [Better terminal navigation] (Terminal)

curl -sS https://raw.githubusercontent.com/ajeetdsouza/zoxide/main/install.sh | source

eval "$(zoxide init --cmd cd bash)" >> "$config_file"

echo "Zoxide has been successfully installed"

### Sync config file with the changes

source "$config_file"
