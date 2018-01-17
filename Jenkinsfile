node{
    stage('checkout'){
        checkout scm
    }
    stage('SonarQube analysis') {
        def sonar_home = tool name: 'sonar_scanner';
        withSonarQubeEnv('sonar_service') {
            sh "${sonar_home}/bin/sonar-scanner"
        }
    }
    stage('mvn build'){
        //mvn构建
        sh "mvn clean install"
    }
    stage('deploy'){
        //执行部署脚本
        echo "deploy ......" 
    }
}
