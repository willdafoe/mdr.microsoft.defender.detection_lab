#!/bin/bash

galaxy_requirements=$(ansible-galaxy install -r galaxy-requirements.yml)
echo $galaxy_requirements | grep -i "installed successfully"