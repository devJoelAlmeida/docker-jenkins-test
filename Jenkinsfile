def var1 = 'VAR1'

pipeline {
    agent any
    stages() {
        stage('Preparation'){
            steps{
            echo env.BRANCH_NAME

            checkout(scm)

            configFileProvider([configFile(fileId: '7acadd24-19e4-42a9-aa36-331d10121401', variable: 'deployment_settings')]) {
                echo ':::VARS:::'
                echo '::::::::::'
                echo ':::container name:::'
                echo deployment_settings.container_name
                echo deployment_settings.image_name
                echo deployment_settings.docker_id

                echo "${var1}"
                echo "${var2}"
            }
    }


        }
        stage('Build') {
            steps {
                sh 'sudo docker build -t ${DOCKER_IMAGE} .'
            }
        }
        stage('Test') {
            steps {
                sh 'sudo docker run -d --rm --name gtest ${DOCKER_IMAGE}'
            }
        }
        stage('Clean-up'){
            steps{
                sh 'sudo docker rm -f gtest'
            }
        }
        stage('Push image') {
            steps{
                echo 'skipping this step in dev environment'
            }
        }
        stage('Deploy') {
            steps {
                sh 'sudo docker run -d --name ${CONTAINER_NAME} ${DOCKER_IMAGE}'
            }
        }
    }
}