node {
  def deploymentConfigs

  stage('Preparation') {
    
    checkout(scm)
    configFileProvider([configFile(fileId: "7acadd24-19e4-42a9-aa36-331d10121401", variable: 'deploymentConfigsFile')]) {
      deploymentConfigs = readJSON(file: deploymentConfigsFile)
    }

    container_status = sh(returnStdout: true, script:"docker inspect -f '{{.State.Running}}' ${deploymentConfigs.container_name}").trim()

    if (container_status == 'true'){
      sh("docker stop ${deploymentConfigs.container_name}")
    } 

  }
  
  stage('Build') {
    sh("docker build -t ${deploymentConfigs.image_name} .")
  }

  stage('Test'){
    echo(">>>>Under Development<<<<")
  }

  stage('Publish'){
    echo(">>>>Under Development<<<<")
    //sh('docker tag ${deploymentConfigs.image_name} ${deploymentConfigs.registry_url}/${deploymentConfigs.image_name}')
    //sh('docker push ${deploymentConfigs.registry_url}/${deploymentConfigs.image_name}')
  }

  stage('Deploy') {
    sh("docker run -d --rm --name ${deploymentConfigs.container_name} ${deploymentConfigs.image_name}:latest")
  }

 }