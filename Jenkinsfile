pipeline {

    agent any

    tools {
        maven 'my-maven'
    }
    stages {

        stage('Build with Maven') {
            steps {
                sh 'mvn --version'
                sh 'java -version'
                sh 'mvn clean package -Dmaven.test.failure.ignore=true'
            }
        }

        stage('Packaging/Pushing imagae') {

            steps {
                echo 'Deploying and cleaning'
//                 sh 'docker image pull khaliddinh/springboot'
                sh 'docker stop app || echo "this container does not exist" '
//                 sh 'docker network create dev || echo "this network exists"'
                sh 'echo y | docker container prune '
            }
        }

        stage('Deploy Spring Boot to DEV') {
            steps {
                sh 'docker build -t minhdang2001/springboot:v1 .'
//                 sh 'docker container run -d --rm --name minhdang2001/springboot -p 8081:8080'
                sh 'docker run -dp 8080:8080 --name app minhdang2001/springboot:v1'

            }
        }

    }
    post {
        // Clean after build
        always {
            cleanWs()
        }
    }
}