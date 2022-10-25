yaml() {
    python3 -c "import yaml;print(yaml.safe_load(open('$1'))$2)"
}

sudo ansible-vault decrypt /etc/korp/ansible/inventory.yml --vault-id /etc/korp/ansible/.vault_key
VALUE=$()
echo $VALUE
sudo ansible-vault encrypt /etc/korp/ansible/inventory.yml --vault-id /etc/korp/ansible/.vault_key



