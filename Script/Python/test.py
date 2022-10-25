import yaml

def read_yml(ymlfile):
    with open(ymlfile) as file:
        out_dict = yaml.load(file, Loader=yaml.FullLoader)
    return out_dict
people_dict = read_yml(ymlfile="inventory.yaml")
print(people_dict)


''''yaml() {
    python3 -c "import yaml;print(yaml.safe_load(open('$1'))$2)"
}'''