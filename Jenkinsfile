pipeline {
	agent any 
	environment {
		DOCKER_HUB_REPO = "vakkasoglu/capstone-project"
		CONTAINER_NAME = "capstone-project"
		REGISTRY_CREDENTIAL = "dockerhub"

	}
	stages {
		stage('Clean up') {
			steps {
				script {
					sh 'rm -rf 2020_03_DO_Boston_Casestudy_Part_2'
				}
			}
		}
		stage('Clone repository') {
			steps {
				script {
					sh 'git clone https://github.com/mvakkasoglu/2020_03_DO_Boston_Casestudy_Part_2.git'
				}
			}
		}
		stage('Test') {
			steps{
			    script {
				    sh 'echo "Successful"'
				}
			}
		}
		stage('Build docker image') {
			steps {
				script {
					dir('./2020_03_DO_Boston_Casestudy_Part_2') {
						sh '/usr/local/bin/docker image build -t $DOCKER_HUB_REPO:latest .'
						sh '/usr/local/bin/docker image tag $DOCKER_HUB_REPO:latest $DOCKER_HUB_REPO:$BUILD_NUMBER'
					} 
				}
			}
		}
		stage('Push docker image') {
		    steps {
			    script {
			        dir('./jenkins-docker-image-build') {
				        docker.withRegistry( '', REGISTRY_CREDENTIAL ) {
				            sh '/usr/local/bin/docker push vakkasoglu/capstone-project:$BUILD_NUMBER'
				            sh '/usr/local/bin/docker push vakkasoglu/capstone-project:latest'
				    
				        }
				    }
				}
			}
		}
		stage('Deploy to kubernetes') {
			steps {
			    dir('./2020_03_DO_Boston_Casestudy_Part_2') {
				    script {
					    sh 'kubectl apply -f kubernetes.yaml'
                        sh 'kubectl get service/capstone-project-service'
				    }
				}
			}
		}
		stage('Minikube service') {
		    steps {
		        dir('./2020_03_DO_Boston_Casestudy_Part_2') {
				    script {
		                // sh 'minikube service capstone-project-service'
		                sh 'echo "Application deployed" '
					}
		        }
		    }
		}
	}
}