node {
  def deploymentConfigs

  stage('Preparation') {
    
    checkout(scm)
    configFileProvider([configFile(fileId: "7acadd24-19e4-42a9-aa36-331d10121401", variable: 'deploymentConfigsFile')]) {
      deploymentConfigs = readJSON(file: deploymentConfigsFile)
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
  
  stage('Build') {
    sh("sudo docker build -t ${deploymentConfigs.image_name} .")
  }

  //stage('Test'){
  //  echo(">>>>Under Development<<<<")
  //}

  stage('Publish'){
    echo(">>>>Under Development<<<<")
    //sh('docker tag ${deploymentConfigs.image_name} ${deploymentConfigs.registry_url}/${deploymentConfigs.image_name}')
    sh('docker login docker.io -u ${deploymentConfigs.docker_id} -p ${deploymentConfigs.docker_pw}')
    sh('docker push ${deploymentConfigs.image_name}')
  }

  stage('Deploy') {
    //May Not be necessary
    sh("sudo docker run -d --rm --name ${deploymentConfigs.container_name} ${deploymentConfigs.image_name}:latest")
  }

}