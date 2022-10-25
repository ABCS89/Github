#!/bin/bash

sudo ansible-vault view /etc/korp/ansible/inventory.yml --vault-id /etc/korp/ansible/.vault_key 
