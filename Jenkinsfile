pipeline {
    agent any
    environment {
        DOCKER_IMAGE = github-test:latest
        CONTAINER_NAME = gtest
        DOCKER_ID_USER = joeldev
    }
    stages() {
        stage('Build') {
            steps {
                sh 'docker build -t $(DOCKER_IMAGE) .'
            }
        }
        stage('Test') {
            steps {
                sh 'docker run --rm --name $(CONTAINER_NAME) $(DOCKER_IMAGE)'
            }
        }
        stage('Clean-up'){
            steps{
                sh 'docker rm -f $(CONTAINER_NAME)'
            }
        }
        stage('Push image') {
            steps{
                sh 'docker push DOCKER_ID_USER/$(DOCKER_IMAGE)'
            }
        }
        stage('Deploy') {
            steps {
                sh 'docker run --name $(CONTAINER_NAME) DOCKER_ID_USER/$(DOCKER_IMAGE)'
            }
        }
    }
}