pipeline {
  agent any
  stages {
    stage('SonarQube analysis') {
      steps {
        sh 'sonar_home = tool \'sonar_scanner\''
      }
    }
  }
}