# Capstone Project

The project was build using Circleci for Continous Integration(CI), Flux for Continous Deployment(CD), and Kubernetes as cloud platform. The app that is deployed is the one developed on project 4, about a Machine Learning Microservice.

Here are steps to build the CI/CD pipeline(GitOps):

- Run the CI pipeline by pushing the code to github or run the workflow in the Circleci app. This will lint the code, build the app image and upload it to DockerHub and create the infrastructure using aws cloudformation to create the VPC, subnetes and security groups, and Kubernetes cluster and node.
- 


## Running the project

To run the project just follow the three scripts files:
1) run_docker.sh
2) upload_docker.sh
3) run_kubernetes.sh
4) make_prediction.sh

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

