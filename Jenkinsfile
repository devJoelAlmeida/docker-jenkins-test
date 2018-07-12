pipeline {
    agent any
    environment {
        DOCKER_IMAGE = 'github-test:latest'
        CONTAINER_NAME = 'gtest'
        DOCKER_ID_USER = 'joeldev'
    }
    stages() {
        stage('Build') {
            steps {
                sh 'sudo docker build -t ${DOCKER_IMAGE} .'
            }
        }
        stage('Test') {
            steps {
                sh 'sudo docker run -d --rm --name ${CONTAINER_NAME} ${DOCKER_IMAGE}'
            }
        }
        stage('Clean-up'){
            steps{
                sh 'sudo docker rm -f ${CONTAINER_NAME}'
            }
        }
        stage('Push image') {
            steps{
                sh 'sudo docker push ${DOCKER_ID_USER}/${DOCKER_IMAGE}'
            }
        }
        stage('Deploy') {
            steps {
                sh 'sudo docker run --name ${CONTAINER_NAME} ${DOCKER_ID_USER}/${DOCKER_IMAGE}'
            }
        }
    }
}