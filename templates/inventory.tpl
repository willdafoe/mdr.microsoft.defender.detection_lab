plugin: azure.azcollection.azure_rm
auth_source: credential_file
client_id: "37943fa3-bc2f-4253-b0a3-529c6f6342a3"
tenant: "4f5e45fb-4db4-464a-a8d2-f72ee1494603"
subscription_id: "3da7ef78-26b8-41b2-8af2-bcd75cb3ea12"

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