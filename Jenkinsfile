
def deploymentConfigs
pipeline {
    agent any
    stages() {
        stage('Preparation'){
            steps{
                script{
                    checkout(scm)
                    configFileProvider([configFile(fileId: '7acadd24-19e4-42a9-aa36-331d10121401', variable: 'deploymentConfigsFile')]) {
                        
                        deploymentConfigs = readJSON(file: "${deploymentConfigsFile}")
                    }
                    //May not be necessary
                    //check if the container exists
                    container_id = sh(returnStdout: true, script:"sudo docker ps -q -f name=${deploymentConfigs.container_name}").trim()

                    if(container_id){
                    //if the container exists check if it's running
                        container_status = sh(returnStdout: true, script:"sudo docker inspect -f '{{.State.Running}}' ${deploymentConfigs.container_name}").trim()

                    //if it is running stop the container => causing it to destroy as --rm is passed in the run command
                        if (container_status == 'true'){
                            sh("sudo docker stop ${deploymentConfigs.container_name}")
                            
                        }
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