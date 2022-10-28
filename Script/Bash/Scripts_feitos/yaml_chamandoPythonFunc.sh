yaml() {
    python3 -c "import yaml;print(yaml.safe_load(open('$1'))$2)"
}
VALUE=$(yaml)
echo $VALUE




