node {
  def deploymentConfigs

  stage('Preparation') {
    
    checkout(scm)

    configFileProvider([configFile(fileId: "7acadd24-19e4-42a9-aa36-331d10121401", variable: 'deploymentConfigsFile')]) {
      deploymentConfigs = readJSON(file: deploymentConfigsFile)
    }
  }
  
  stage('Build') {
    echo("${deploymentConfigs.container_name}")
  }

  stage('Deploy') {
    echo("TEST")
  }
 }