

pipeline {
    agent any
    stages() {
        stage('Preparation'){
            steps{
                echo env.BRANCH_NAME

                
                script{
                    configFileProvider([configFile(fileId: '7acadd24-19e4-42a9-aa36-331d10121401', variable: 'deploymentConfigs')]) {
                    }
                    echo $deploymentConfigs
                }
                echo $deploymentConfigs

                checkout(scm)
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