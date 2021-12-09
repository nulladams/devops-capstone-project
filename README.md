[![CircleCI](https://circleci.com/gh/nulladams/project4-devops/tree/master.svg?style=svg)](https://circleci.com/gh/nulladams/project4-devops/tree/master)

# project4-devops

This project operationalize a Machine Learning Microservice API. A sklearn model has been trained to predict housing prices in Boston according to several features, such as average rooms in a home and data about highway access, teacher-to-pupil ratios, and so on. You can read more about the data, which was initially taken from Kaggle, on the data source site. This project tests your ability to operationalize a Python flask app—in a provided file, app.py

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


