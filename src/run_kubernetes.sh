#!/usr/bin/env bash

# This tags and uploads an image to Docker Hub

# Step 1:
# This is your Docker ID/path
# dockerpath=<>
dockerpath=leoadams/project4

# Step 2
# Run the Docker Hub container with kubernetes
kubectl apply -f .\k8s\deployment.yaml
kubectl apply -f .\k8s\service.yaml


# Step 3:
# List kubernetes pods
kubectl get pods

# Step 4:
# Forward the container port to a host
kubectl port-forward project4-deploy-6697859c96-hgwhb 8080:80

