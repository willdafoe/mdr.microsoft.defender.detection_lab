#!/bin/bash
set -e -o pipefail
export DEBIAN_FRONTEND=noninteractive

echo "Updating apt cache..."
apt update
echo "Installing software-properties-common..."
apt -y install software-properties-common

update=$(apt list upgradeable |& grep -Ev '^(Listing|WARNING)')

if [ -z "$update" ]; then
  echo "No updates available"
else
  echo "Updates available"
  echo "$update"
  echo "Running apt update"
  echo "apt -y update"
  apt -y update
fi

# Add Ansible PPA
ansible_ppa="ansible/ansible"
ppa_exists=$(grep -s -r "^deb .*$ansible_ppa" /etc/apt/sources.list /etc/apt/sources.list.d/*)

if [ -z "$ppa_exists" ]; then
    # commands to add the ppa ...
    echo ""
    echo "Adding Ansible PPA"
    echo "add-apt-repository --yes --update ppa:ansible/ansible"
    add-apt-repository --yes --update ppa:ansible/ansible
else
    echo "Ansible PPA already added"
fi

echo " "
echo "Installing Ansible..."
echo "apt -y install ansible"
echo 'tzdata tzdata/Areas select America' | debconf-set-selections
echo 'tzdata tzdata/Zones/America select Central' | debconf-set-selections
apt -y install ansible

echo " "
echo "Installing pip3..."
echo "apt -y install python3-pip"
apt -y install python3-pip

echo " "
echo "Installing Ansible Azure Collection..."
echo "ansible-galaxy collection install azure.azcollection"
ansible-galaxy collection install azure.azcollection

echo " "
echo "Installing Azure python3 requirements..."
echo "pip3 install -r ./collections/ansible_collections/azure/azcollection/requirements-azure.txt"
pip3 install -r ./collections/ansible_collections/azure/azcollection/requirements-azure.txt



