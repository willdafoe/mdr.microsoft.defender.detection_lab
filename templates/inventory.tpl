vars:
  ansible_python_interpreter: /usr/bin/python3
plugin: azure_rm
auth_source: cli

include_vm_resource_groups:
    - ${ resource_group_name }

conditional_groups:
    all: true
    windows_servers: "'MicrosoftWindowsServer' in image.publisher"
    windows_clients: "'MicrosoftWindowsDesktop' in image.publisher"

keyed_groups:
    - prefix: location
      key: location
    - prefix: os
      key: image.offer
    - prefix: role
      key: tags.role
    - prefix: app_name
      key: tags.app_name