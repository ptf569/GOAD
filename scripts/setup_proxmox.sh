#!/bin/bash

sudo apt update
sudo apt install -y git vim tmux curl gnupg software-properties-common mkisofs

######################################################################################################
# PACKER & TERRAFORM

# Install the HashiCorp GPG key.
wget -O- https://apt.releases.hashicorp.com/gpg | sudo \
gpg --dearmor -o /usr/share/keyrings/hashicorp-archive-keyring.gpg

# Add Hashicorp Source List
echo "deb [arch=$(dpkg --print-architecture) \
signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] \
https://apt.releases.hashicorp.com $(lsb_release -cs) main" \
| sudo tee /etc/apt/sources.list.d/hashicorp.list

sudo apt update && sudo apt install -y packer terraform

######################################################################################################
# ANSIBLE
sudo apt install -y python3-pip python3-venv 

python3 -m venv .venv
source .venv/bin/activate

python3 -m pip install --upgrade pip
python3 -m pip install ansible-core==2.12.6
python3 -m pip install pywinrm

######################################################################################################
# ANSIBLE Galaxy
ansible-galaxy install -r ansible/requirements.yml
