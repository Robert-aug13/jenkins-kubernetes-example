pipeline {
 agent any 

	tools {
	maven  "MAVEN_HOME"
	}
	stages {
		stage ('Checkout') {
			steps {
			git branch : 'main' , url: 'https://github.com/Robert-aug13/jenkins-kubernetes-example.git'

			}
		}

		stage ('Execute Maven') {
			steps {
	    
			sh 'mvn package'   }
	}
		stage ('Building docker image') {
			steps {
			sh 'docker buid -t gcr.io/hidden-digit-330710/rob-image:v1 .'
			sh  'docker images'

			}
		}

		stage ('Pushing Image to GCR') {
			steps {
			
			sh 'docker push gcr.io/hidden-digit-330710/rob-image:v1'
			}
		}
		}
		}
		
