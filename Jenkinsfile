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
			//sh 'sudo chmod 666 /var/run/docker.sock'
			//sh 'docker  rm rob-image:v1'
			//sh 'sleep 15'
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
			sh 'sleep 12'
			sh 'kubectl rollout status deployment/nodejs-app'
			sh 'sleep 45'
			sh 'kubectl get deployments,svc'
			sh 'curl localhost:80/health'
			sh 'sleep 10'
			//sh 'kubectl port-forward service/nodejs-app 80:3000'
			
		}
		}
		stage ('cleanup') {
			steps {
			
			sh 'gcloud container clusters delete local-clustercontext --zone us-central1-a --quiet'
			
		        
			}
		}
	}
}
