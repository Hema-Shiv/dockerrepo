pipeline{
    agent {label 'docker'}
    environment {
    DOCKERHUB_CREDENTIALS = credentials('dockerhub')
    }
    stages{
       stage('Git Checkout Stage'){
            steps{
               checkout scm
            }
         }        
       stage('Build docker image'){
            steps{
                sh 'docker build -t hemaj/ubuntu:$BUILD_NUMBER . '
            }
         }
        stage('login to dockerhub') {
            steps{
             sh "echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u $DOCKERHUB_CREDENTIALS_USR --password-stdin"
                }
            }
        stage('push image'){
            steps{
                sh "docker push hemaj/ubuntu:$BUILD_NUMBER"
            }   
        }
       stage('depoly on dockerhost'){
            steps{
                sh "docker run -d --name firstdeploy -p 8082:8080 hemaj/ubuntu:$BUILD_NUMBER"
            }
       }
    }
}
