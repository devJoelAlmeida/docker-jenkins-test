node {
    def app
    def deploymentConfigs
    stage('Preparation') {
        // Clone Repository
        checkout scm
        // Load Config File
        configFileProvider([configFile(fileId: "fa51d500-6d3f-402e-b5cc-ddb5c1041fe4", variable: 'deploymentConfigsFile')]) {
      deploymentConfigs = readJSON(file: deploymentConfigsFile)
      }
    }
    stage('Build image') {
        app = docker.build("${deploymentConfigs.repo_name}/${deploymentConfigs.image_name}")
    }
    /*stage('Test image') {
        // Tests will be included inside:
        // check versions of python and dependencies 
        // SMTP login
        // check for files (templates)
        
        app.inside {
            sh 'echo "Tests passed"'
        }
    }*/
    stage('Push image') {
        echo("docker.withRegistry('${deploymentConfigs.registry}', 'docker-registry-credentials')") 
        echo("app.push('${env.BUILD_NUMBER}')")
        echo("app.push('latest')")  
    }

    post{
        unstable {
            slackSend (color: '#FFFE89', message: "UNSTABLE: Job '${env.JOB_NAME} [${env.BUILD_NUMBER}]' (${env.BUILD_URL})")
        }
        failure {
            slackSend (color: '#FF9FA1', message: "FAIL: Job '${env.JOB_NAME} [${env.BUILD_NUMBER}]' (${env.BUILD_URL})")
        }
        success {
            slackSend (color: '#BDFFC3', message: "SUCCESS: Job '${env.JOB_NAME} [${env.BUILD_NUMBER}]' (${env.BUILD_URL})")
        }
    }
}