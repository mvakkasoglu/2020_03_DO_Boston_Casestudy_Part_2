# Capstone-Project

## Jenkins(CI/CD) pipeline to deploy Python-Flask application onto Kubernetes cluster.


Requirements for this project can be found [here](https://docs.google.com/document/d/1J5rvYyM-EjEq1GFcrTuVrwn6q1INIp6U6J1MS3OhOJM/edit?usp=sharing)

You can finde the presentation [here] (https://docs.google.com/presentation/d/1vbWeqcB3e70dhrJwoBTGotMDHxniwKJaE7BBsvFqYRY/edit?usp=sharing)
 
### Steps followed: 

1- Create a respective requirements.txt to download any pip dependencies for this python project.

2- Create a Dockerfile which builds the image.

3- Build and Push image to Dockerhub.

$ docker build -t vakkasoglu/sba-kubernetes-cluster .

$ docker login

Enter YOUR_USERNAME and password when prompted.

$ docker push vakkasoglu/sba-kubernetes-cluster

Test Docker image locally to make sure it is working.

4- Create a kubernetes.yaml which will pull the aforementioned Dockerhub image and create 3 running copies of it.

5- Use the kubernetes.yaml to launch your application

$ kubectl create -f kubernetes.yaml

$ kubectl apply -f kubernetes.yaml

Or 

$ kubectl replace --force -f kubernetes.yaml

Some useful commands...

$ kubectl get services → displays the services running

$ minikube service <service-name> → application pops-up in the browser

Clean up → $ kubectl delete service <service_name>

-------------------- Make sure Kubernetes run locally successfully --------------------------

8- Start Jenkins locally - (in my case since Jenkins is installed using brew, I use command '$ brew services start jenkins' )

- Configure Jenkins
- Install required plugins (Git, Docker, Pipeline etc)
- Configure credentials for Docker

9- Create Jenkinsfile

Jenkinsfile pulls the code from Github, clones it, runs tests, builds a new Docker image, pushes the image to DockerHub repository and deploys the application to kubernetes cluster.



