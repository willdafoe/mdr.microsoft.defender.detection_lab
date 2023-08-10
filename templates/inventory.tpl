plugin: azure_rm
include_vm_resource_groups:
    - ${ resource_group_name }

conditional_groups:
    all: true
    domain_controllers: "'dc' in computer_name"
    windows_servers: "'WindowsServer' in image.offer"
    windows_clients: "'MicrosoftWindowsDesktop' in image.publisher"