# Capstone Project

The project was build using Circleci for Continous Integration(CI), Flux for Continous Deployment(CD), and Kubernetes as cloud platform. The app that is deployed is the one developed on project 4, about a Machine Learning Microservice.

Here are steps to build the CI/CD pipeline(GitOps):

1) Run the CI pipeline by pushing the code to github or run the workflow in the Circleci app. This will lint the code, build the app image and upload it to DockerHub and create the infrastructure using aws cloudformation to create the VPC, subnetes and security groups, and Kubernetes cluster and node.

2) Update k8s to work with the cluster
```
aws eks update-kubeconfig --name capstone-eks --region us-west-2 --profile capstone
```

3) To install flux, download it from flux github release page and put the file in the system path.

4) Create namespace for Flux;
kubectl create ns flux

5) Install Flux in the cluster
GHUSER="nulladams"
fluxctl install \
--git-user=${GHUSER} \
--git-email=${GHUSER}@users.noreply.github.com \
--git-url=git@github.com:${GHUSER}/devops-capstone-project \
--git-path=src/k8s \
--git-branch=main \
--namespace=flux | kubectl apply -f -

6) Set enviorment variable for flux namespace
export FLUX_FORWARD_NAMESPACE=flux

7) Generate security/credentials and authentication with flux identity and create deploy key in Github
fluxctl identity

8) To check if the app is running:
kubectl get pods

9) In the aws console, go to Load Balancer and get the service DNS and go to link in the browser adding the port 8080
Example of testing in Postman:
- Request: POST
- Address: http://aa1a621b581d148d8842e2fb38b4e00a-313279511.us-west-2.elb.amazonaws.com:8080/predict
- Headers: Content-Type: application/json
- body:
{  
   "CHAS":{  
      "0":0
   },
   "RM":{  
      "0":6.575
   },
   "TAX":{  
      "0":296.0
   },
   "PTRATIO":{  
      "0":15.3
   },
   "B":{  
      "0":396.9
   },
   "LSTAT":{  
      "0":4.98
   }
}

## Project files
Project files can be found inside the src directory:
- app.py - app source code
- Dockerfile - create docker container  for the project
- make_prediction.sh* - script to test the app
- Makefile - file to simplify app and depencies installation
- output_txt_files/ - folder with files regarding app outputs
- requirements.txt - app dependecies
- run_docker.sh* - script to create and run the docker container
- run_kubernetes.sh* - script to create and run pods with the app container
- upload_docker.sh* - script to upload the docker image to the cloud
- run-flux.sh* - script to install Flux
- .config.yml - Configuration file for Circleci

## Cleanup
To delete the cluster, nodes and roles:

aws eks delete-nodegroup --cluster-name capstone-eks --nodegroup-name node1

aws eks delete-cluster --name capstone-ek

aws iam detach-role-policy --role-name capstone-eks-role --policy-arn  arn:aws:iam::aws:policy/AmazonEKSClusterPolicy
aws iam delete-role --role-name capstone-eks-role

aws iam detach-role-policy --role-name capstone-eks-role-nodes --policy-arn  arn:aws:iam::aws:policy/AmazonEKSWorkerNodePolicy
aws iam detach-role-policy --role-name capstone-eks-role-nodes --policy-arn  arn:aws:iam::aws:policy/AmazonEKS_CNI_Policy
aws iam detach-role-policy --role-name capstone-eks-role-nodes --policy-arn  arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryReadOnly

aws iam delete-role --role-name capstone-eks-role-nodes

aws cloudformation delete-stack --stack-name capstone-eks-stack

