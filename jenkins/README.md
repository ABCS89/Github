============ Neste arquivo contem um passo a passo para instalar e configurar o K3s junto do Jenkins ============

Tutorial em inglês: https://bit.ly/2K6U86j
Documentação do K3s: https://bit.ly/2YsF1wb
Github K3s: https://bit.ly/33cy9Tc

Pré-requisitos:
    - Ter uma VM com Ubuntu-Server já rodando.
    - Rodar todos os comando em modo usuário, caso necessário, será adicionado sudo na frente!

Instalação e configuração K3s: (!! RODE TODOS OS COMANDOS EM MODO USUÁRIO E NÃO ROOT !!)
    1. Com o terminal Ubuntu aberto no Putty, cole o seguinte comando e pressione Enter: "curl -sfL https://get.k3s.io | sh -";
    2. Certifique-se que está na pasta /home/USUARIO;
    3. Rode o comando: "sudo cp /etc/rancher/k3s/k3s.yaml .". Isso irá copiar o arquivo de configuração do K3s para a pasta do usuário;
    4. Abra o arquivo que copiamos, usando "sudo vim k3s.yaml" e substitua o o valor do campo "server" de "https://localhost:6443" por "https://IP_DA_MAQUINA:6443". Salve o arquivo;
    5. Precisamos que o K3s utilize esse arquivo modificado, para isso utilize "export KUBECONFIG=/home/USUARIO/k3s.yaml";
    6. Para testar se funcionou corretamente, utilize "sudo kubectl get nodes", caso o status esteja Ready, tudo ocorreu como o esperado;

Instalação de Data Persist: (!! RODE TODOS OS COMANDOS EM MODO USUÁRIO E NÃO ROOT !!)
    Kubernetes por padrão não mantem os arquivos após um Reboot da maquina host, por isso temos de instalar um arquivo de configuração de Data Persist.

    1. Certifique-se que está na pasta /home/USUARIO;
    2. Rode o comando "curl -LO https://raw.githubusercontent.com/rancher/local-path-provisioner/master/deploy/local-path-storage.yaml", que ira baixar um arquivo de Helm yaml;
    3. Aplique o arquivo baixado ao Kubernetes usando "sudo kubectl apply -f local-path-storage.yaml";
    4. Selecione o que e onde será salvo: "sudo kubectl patch storageclass local-path -p '{"metadata": {"annotations":{"storageclass.kubernetes.io/is-default-class":"true"}}}'";
    5. Caso no ultimo comando tudo de como completed, está tudo configurado.

Instalação do Jenkins: (!! RODE TODOS OS COMANDOS EM MODO USUÁRIO E NÃO ROOT !!)
    1. Certifique-se que está na pasta /home/USUARIO;
    2. Digite "vim jenkins.yaml" para criar um novo arquivo yaml;
    3. Abra o arquivo "jenkins.yaml" que está nesta pasta (CI-CD) e copie todo seu conteúdo;
    4. Cole o que foi copiado no terminal em que foi criado o arquivo do passo 2. Salve o arquivo;
    5. Crie um novo namespace usando: "sudo kubectl create ns jenkins";
    6. Aplique o arquivo Helm criado usando: "sudo kubectl apply -f jenkins.yaml";
    7. Para se certificar que foi criado com sucesso, utilize o comando "sudo kubectl -n kube-system get pods". Caso o status do "helm-install-jenkins-XXXXX" esteja "Completed", tudo ocorreu como o esperado;
    8. Utilizando o comando "sudo kubectl get pods -n jenkins -w", verifique se o status esra Ready 1/1, isso que dizer que o Jenkins já está pronto;
    9. Para acessá-lo externamente, precisamos liberar a porta para o IP_DA_MAQUINA, para isso entre com o comando "sudo kubectl delete services jenkins -n jenkins", isso irá deletar o serviço kubernetes criado pelo Jenkins;
    10. Vamos criar um serviço com acesso externo com o comando "sudo kubectl expose deployment -n jenkins jenkins --type=LoadBalancer --name=jenkins".
    
    Agora o Jenkins já pode ser acessado pelo endereço: https://IP_DA_MAQUINA:8080.