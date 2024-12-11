<div align="center">

# Tech Challenge - k8s

![GitHub Release Date](https://img.shields.io/badge/Release%20Date-Dezembro%202024-yellowgreen)
![](https://img.shields.io/badge/Status-Em%20Desenvolvimento-yellowgreen)
<br>
![](https://img.shields.io/badge/Version-%20v1.0.0-brightgreen)
</div>

## 💻 Descrição

Este repositório é responsável por criar o cluster e toda a infraestrutura necessária para provisionar a aplicação.

## 🛠 Tecnologias Utilizadas

<div align="center">

![GithubAction](https://img.shields.io/badge/GitHub%20Actions-2088FF.svg?style=for-the-badge&logo=GitHub-Actions&logoColor=white)
![Kubernetes](https://img.shields.io/badge/Kubernetes-3069DE?style=for-the-badge&logo=kubernetes&logoColor=white)
![EKS](https://img.shields.io/badge/Amazon%20EKS-FF9900.svg?style=for-the-badge&logo=Amazon-EKS&logoColor=white)
![Terraform](https://img.shields.io/badge/Terraform-7B42BC?style=for-the-badge&logo=terraform&logoColor=white)

</div>

## ⚙️ Configuração

### Pré-requisitos

1. É necessário executar a pipeline para criar o VPC no repositório: https://github.com/fiap-soat-12/fiap-soat-tech-challenge-vpc
2. É necessário executar a pipeline para criar o RDS no repositório: https://github.com/fiap-soat-12/fiap-soat-tech-challenge-db
3. É necessário executar a pipeline para criar a imagem no ECR no repositório: https://github.com/fiap-soat-12/fiap-soat-tech-challenge-api

### Desenvolvimento

- **[Kubernetes](https://kubernetes.io/pt-br/docs/home/)**: Documentação oficial do Kubernetes.
- **[Terraform](https://www.terraform.io/)**: Site oficial do Terraform.

## 🚀 Execução

### Subindo aplicação em Cluster EKS
  Caso deseje subir a aplicação em um cluster EKS em uma conta AWS, basta seguir os seguintes passos:
  
  1. Certificar que o Terraform esteja instalado executando o comando `terraform --version`;
  ![terraform-version](./assets/terraform-version.png)

  2. Certificar que o `aws cli` está instalado e configurado com as credenciais da sua conta AWS;
  ![aws-cli-version](./assets/aws-cli-version.png)

  3. Acessar a pasta `terraform/cluster` que contém os arquivos que irão criar um Cluster EKS e Work Nodes na AWS;
  4. Inicializar o Terraform no projeto `terraform init`;
  5. Verificar que o script do Terraform é valido rodando o comando `terraform validate`;
  6. Executar o comando `terraform plan` para executar o planejamento da execução/implementação;
  7. Executar o comando `terraform apply` para criar a infra dentro do cluster;
  8. Após a execução do Terraform finalizar, verificar se o cluster e os nodes foram inicializados na AWS;
  ![eks-cluster](./assets/eks-cluster.png)
  9. Após a criação do cluster, é necessário configurar o kubeconfig para que o `kubectl` aponte para o novo cluster criado na AWS. Para fazer isso, basta executar o comando `aws eks update-kubeconfig --region us-east-1 --name fiap-tech-challenge-eks-cluster`. A region escolhida para que o cluster seja criado foi a `us-east-1` e o nome do cluster é `fiap-tech-challenge-eks-cluster`
  10. Acessar a pasta `terraform/infra` que contém os arquivos que irão criar os Pods da aplicação e do Banco de Dados, os services e os recursos relacionados à monitoração na AWS;
  11. Inicializar o Terraform no projeto `terraform init`;
  12. Verificar que o script do Terraform é valido rodando o comando `terraform validate`;
  13. Executar o comando `terraform plan` para executar o planejamento da execução/implementação;
  14. Executar o comando `terraform apply` para criar a infra dentro do cluster;
