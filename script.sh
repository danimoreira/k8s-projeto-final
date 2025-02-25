#!/bin/bash

echo "Criando as imagens .........."

docker build -t danielmoreiradeveloper/projeto-final-k8s-backend:1.0 backend/.
docker build -t danielmoreiradeveloper/projeto-final-k8s-database:1.0 database/.

echo "Realizando push das imagens .........."

docker push danielmoreiradeveloper/projeto-final-k8s-backend:1.0
docker push danielmoreiradeveloper/projeto-final-k8s-database:1.0

echo "Criando serviços no cluster Kubernetes"

kubectl apply -f ./services.yml

echo "Criando os deployments"

kubectl apply -f ./deployment.yml