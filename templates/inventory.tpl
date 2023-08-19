plugin: azure.azcollection.azure_rm
auth_source: credential_file
client_id: '{{ azure_client_id }}'
tenant: '{{ azure_tenant_id }}'
subscription_id: '{{ azure_subscription_id }}'

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