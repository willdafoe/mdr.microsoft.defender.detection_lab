#!/bin/bash

if !(command -v az >/dev/null); then
  echo "ERROR: This script requires Azure CLI 1.0, but it could not be found. Is it installed and on your path?" 1>&2
  exit -1
fi

subscription_list=$(az account list --all)
subscription_list_count=$(echo "$subscription_list_count" | jq -r '. | length' )
echo "$subscription_list_count"

