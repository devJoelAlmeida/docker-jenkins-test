
def deploymentConfigsFile
pipeline {
    agent any
    stages() {
        stage('Preparation'){
             
            steps{
                script{
                    checkout(scm)
                    configFileProvider([configFile(fileId: '7acadd24-19e4-42a9-aa36-331d10121401', variable: 'deploymentConfigsFile')]) {
                    sh 'cat ${deploymentConfigsFile}'
                    deploymentConfigsFile = readJSON(file: deploymentConfigsFile)
                    }
                }
            }
        }
        stage('Build') {
            steps {
                echo 'build stage'
                sh 'sudo docker build -t ${deploymentConfigs.image_name} .'
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
                //sh 'sudo docker run -d --name ${deploymentConfigs.container_name} ${deploymentConfigs.image_name}'
            }
        }
    }
}