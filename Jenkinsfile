pipeline {

    agent any

    tools {
        maven 'my-maven'
    }
    environment {
        MYSQL_ROOT_LOGIN = credentials('mysql-root-login')
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
                sh 'docker build -t minhdang2001/springboot .'

            }
        }

        stage('Deploy Spring Boot to DEV') {
            steps {
                echo 'Deploying and cleaning'
//                 sh 'docker image pull khaliddinh/springboot'
                sh 'docker stop minhdang2001/springboot || echo "this container does not exist" '
//                 sh 'docker network create dev || echo "this network exists"'
                sh 'echo y | docker container prune '

//                 sh 'docker container run -d --rm --name minhdang2001/springboot -p 8081:8080'
                sh 'docker run -p 8080:8080 --name minhdang2001/springboot minhdang2001/springboot'

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