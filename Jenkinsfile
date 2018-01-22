pipeline{
    agent any
    stages {
        stage("Human: Select Action") {                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    
            script {                                                                                                                                                                                                                     
                env.SONNAR = input message: 'Run sonar-scanner or not?',
                parameters: [choice(name: 'ACTION', choices: 'yes\nno')]
            }
        }
        stage('checkout'){
            checkout scm
        }
        stage('SonarQube analysis') {
            when {
                //expression { env.SONNAR == 'yes' }
                environment name : 'SONNAR', value : 'yes'
            }
            steps {
                def sonar_home = tool name: 'sonar_scanner';
                withSonarQubeEnv('sonar_service') {
                    sh "${sonar_home}/bin/sonar-scanner -Dsonar.projectKey=${JOB_NAME} -Dsonar.sources=./src -Dsonar.java.binaries=WebContent/WEB-INF/lib"
                }
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
}
