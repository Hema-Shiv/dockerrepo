pipeline{
    agent {label 'sonarqube'}
    stages{
       stage('Git Checkout Stage'){
            steps{
                git branch: 'main', credentialsId: 'github', url: 'https://github.com/Hema-Shiv/Sonarexample.git'
            }
         }        
       stage('Build Stage'){
            steps{
                sh 'mvn clean install'
            }
         }
        stage('SonarQube Analysis Stage') {
            steps{
                withSonarQubeEnv('sonarqube') { 
                    sh "mvn clean verify sonar:sonar -Dsonar.projectKey=sonar-test"
                }
            }
        }
    }
}
