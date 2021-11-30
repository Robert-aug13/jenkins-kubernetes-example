pipeline {
 agent any 

	tools {
	maven  "Maven"
	}
	stages {
		stage ('Checkout') {
			steps {
			git branch : 'master' , url: 'https://github.com/Robert-aug13/jenkins-kubernetes-example.git'

			}
		}

		stage ('Execute Maven') {
			steps {
	    
			sh 'mvn package'   }
	}
		stage ('Building docker image') {
			steps {
			sh 'docker buid -t gcr.io/hidden-dig-330710/rob-image:v1 .'
			sh  'docker images'

			}
		}

		stage ('Pushing Image to GCR') {
			steps {
			sh 'docker tag webapp:dev01 gcr.io/midevops/webapp:dev01'
			sh 'docker push gcr.io/midevops/webapp:dev01'
			}
		}
		}
		}
		