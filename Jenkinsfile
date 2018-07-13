

pipeline {
    agent any
    stages() {
        stage('Preparation'){
            steps{
                echo env.BRANCH_NAME

                checkout(scm)
                script{
                    configFileProvider([configFile(fileId: 'test-config', variable: 'deploymentConfigs')]) {
                    }
                    echo deploymentConfigs
                }
                echo deploymentConfigs
            }
        }
        stage('Build') {
            steps {
                echo 'build stage'
                //sh 'sudo docker build -t ${DOCKER_IMAGE} .'
            }
        }
        stage('Test') {
            steps {
                echo 'Test Stage'
                //sh 'sudo docker run -d --rm --name gtest ${DOCKER_IMAGE}'
            }
        }
        stage('Clean-up'){
            steps{
                echo '.'
                //sh 'sudo docker rm -f gtest'
            }
        }
        stage('Push image') {
            steps{
                echo 'Push Image Stage'
                echo 'skipping this step in dev environment'
            }
        }
        stage('Deploy') {
            steps {
                echo 'Deploy Stage'
                //sh 'sudo docker run -d --name ${CONTAINER_NAME} ${DOCKER_IMAGE}'
            }
        }
    }
}