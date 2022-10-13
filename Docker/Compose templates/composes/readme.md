# Monitoring - Server

## Arquitetura

    arm64

## Acesso

IP: 144.22.162.228

Usuário: Ubuntu

Senha: monitoring.ppk ([disponível em korp.oauthkeys](https://bitbucket.org/viasoftkorp/korp.oauthkeys/src/master/))

## MountPoints

partição sdb1 montada no diretório `/opt/dados-docker`

## Setup Docker

- Instalar docker seguindo [o tutorial de instalação do docker](https://docs.docker.com/engine/install/ubuntu/#install-using-the-repository)

- Instalar docker-compose

        sudo apt-get install docker-compose

- Adição de usuário `ubuntu` no grupo `docker`

        sudo usermod -a -G docker ubuntu

- Criação de network `servicos`

        docker network create --gateway 172.18.0.1 --subnet 172.18.0.0/16 servicos

## Containers

### Nginx

- Cópia de arquivos

    copiar arquivos de `config/nginx/` para `/opt/dados-docker/nginx/`

- Adicionar certificados à `/opt/dados-docker/nginx/certs/`

- Compose nginx

        docker-compose -f compose-nginx.yml up -d

---

### Portainer

- Criar diretório de portainer:

        mkdir /opt/dados-docker/portainer/ -p

- Setup de portainer

        docker-compose -f compose-portainer.yml up -d

### Postgres

- Criar diretório de postgres:

        mkdir /opt/dados-docker/postgres -p

- Setup de postgres

        docker-compose -f compose-postgres.yml up -d

---

### Zabbix

- Setup de Zabbix

        docker-compose -f compose-zabbix.yml up -d

A configuração do zabbix server não será abordada aqui por ser muito complexa.

Toda sua configuração fica armazenada no DB postgres `zabbix`

Links uteis:

        https://www.zabbix.com/integrations/msteams

---

### Grafana

- Setup de grafana

        docker-compose -f compose-grafana.yml up -d

## Configuração de Salt-Master

- Instalação de salt: ([documentação de instalação](https://docs.saltproject.io/salt/install-guide/en/latest/topics/bootstrap.html#install-using-the-bootstrap-script))

        curl -o bootstrap-salt.sh -L https://bootstrap.saltproject.io
        chmod +x bootstrap-salt.sh
        ./bootstrap-salt.sh -M -N

- Criar arquivo `/etc/salt/master.d/master.conf` com o seguinte conteúdo:

        autosign_grains_dir: /etc/salt/autosign_grains
        
        master_id: salt-master

Alguns do comandos do salt-master:

``` bash
#testa ping em um minion específico
-G 'tenant:<tenant-id>' test.ping

# testa ping em todos os minions
salt '*' test.ping

# executa comanda em um minion específico
salt -G 'tenant:<tenant-id>'  cmd.run '<comando>'

# lista todas as keys
salt-key -L

# lista todos os minions
salt '*' --preview-target

# logs do master1
cat /var/log/salt/master

# copiar arquivo para minion
salt-cp -G 'tenant:<tenant-id>' '<origem>' '<destino>'

# copiar arquivo de minion
# arquivo irá para /var/cache/salt/master/minions/<tenant-id>/files/
# necessário habilitar 'file_recv' em '/etc/salt/master.d/master.conf'
#       após alterar 'master.conf' é necessário reiniciar o serviço: 'systemctl restart salt-master'
# DESABILITE 'file_recv' APOS O USO DO MODULO. ISSO É MUITO IMPORTANTE POIS PODE CAUSAR PROBLEMAS DE SEGURANÇA
salt -G 'tenant:<tenant-id>' cp.push '<origem>' 
```

---
