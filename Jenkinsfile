pipeline {
 agent any 

	stages {
		stage ('Checkout') {
			steps {
			git branch : 'main' , url: 'https://github.com/Robert-aug13/jenkins-kubernetes-example.git'

			}
		}


	
		stage ('Building docker image') {
			steps {
		        sh 'docker build -t rob-image:v1 .'
                        sh 'docker build -t gcr.io/hidden-digit-330710/rob-image:v1 .'
			sh  'docker images'

			}
		}

		stage ('Pushing Image to GCR') {
			steps {
			sh 'gcloud auth configure-docker --quiet'
			sh 'docker push gcr.io/hidden-digit-330710/rob-image:v1'
			}
		}
		stage ('Deployment/service') {
			steps {
			sh 'gcloud container clusters create local-clustercontext --zone us-central1-a'
			sh 'sleep 15'
			//sh 'kubectl get deployments,svc'	
			sh 'kubectl create -f nodejsapp.yaml'
			sh 'sleep 10'
			sh 'kubectl rollout status deployment/nodejs-app'
			sh 'sleep 10'
			sh 'kubectl get deployments.svc'
		}
		}
	}
}
