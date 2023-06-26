## Virtualização - Atividade (Guestbook)

Construa e instale e aplicação Guestbook num cluster Kubernetes fazendo a conexão dela com um clsuter do Redis.

## Pré-Requisitos
* Ter um cluster Kubernetes rodando (usando Minikube ou outra tecnologia similar)
* Ter a ferramenta kubectl instalada

## Instalação do Redis 

### Etapa 1 - Crie o Redis Master

Use o arquivo redis-master-deployment.yaml para criar um deployment e os pods do Redis Master

Para tal, rode o seguinte comando:

    $ kubectl create -f kube/redis-master-deployment.yaml
    
Em seguida, use o arquivo redis-master-service.yaml para criar o serviço referente ao Redis Master:

    $ kubectl create -f kube/redis-master-service.yaml
    services/redis-master

### Etapa 2 - Crie o Redis Slave

Use o arquivo redis-slave-deployment.yaml para criar o Redis Slave:

    $ kubectl create -f kube/redis-slave-deployment.yaml

### Etapa 3 - Verificar se pods estão rodando

Utilize o comando de `kubectl get pods` para verificar se todos os pods referentes aos Redis Master e Slave estão funcionando.


## Instalação da Aplicação Guestbook

* Construa a imagem docker do Guestbook 
    * Lembre-se de redirecionar o docker runtime para usar o minikube `eval $(minikube docker-env)`
    * Use o comando `make build` a partir deste diretório raiz
* Crie os arquivos de Deployment e Service do Guestbook
    * Observe as variáveis de ambiente que são usadas no arquivo `main.go` e faça a injeção correta dessas variáveis no deployment
    * Utilize configmap e secrets para guardar as informações que são passadas como variáveis de ambiente e as injete no pod
* Crie um ingress para acessar a aplicação através do ip raiz do minikube no endereço /guestbook