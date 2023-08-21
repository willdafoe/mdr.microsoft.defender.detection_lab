#!/bin/bash
ansible-playbook \
-e ansible_winrm_server_cert_validation=ignore \
-e ansible_winrm_transport=ntlm \
-e ansible_port=5985 \
-e ansible_winrm_scheme=http \
-e ansible_connection=winrm \
-e admin_username="$1" \
-e admin_password="$2" \
-vvv \
./playbook.yml