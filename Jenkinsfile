node {
  def deploymentConfigs

  stage('Preparation') {
    
    checkout(scm)


    configFileProvider([configFile(fileId: "7acadd24-19e4-42a9-aa36-331d10121401", variable: 'deploymentConfigsFile')]) {
      deploymentConfigs = readYaml(file: deploymentConfigsFile)
    }
    echo(deploymentConfigs)
  }
  
  stage('Build') {
    echo("TEST")
  }

  stage('Deploy') {
    echo("TEST")
  }
 }