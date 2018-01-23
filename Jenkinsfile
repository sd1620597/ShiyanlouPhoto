pipeline{
    agent any
    parameters {
        choice(name: 'DO_SONNAR',choices:'yes\nno', description: '是否允许Sonar-Scanner?')
    }
    stages {
        //stage("Human: Select Action") {
        //    steps{
        //        script {                                                                                                                                                                                                                     
        //            env.SONNAR = input message: 'Run sonar-scanner or not?',
        //            parameters: [choice(name: 'ACTION', choices: 'yes\nno')]
        //        }
        //    }
        //}
        //stage('checkout'){
        //    steps{
        //        checkout scm
        //    }
        //}
        stage('SonarQube analysis') {
            when {
                expression { DO_SONNAR == 'yes' }
                //environment name : 'evn.SONNAR', value : 'yes'
            }
            steps {
                script {
                    sonar_home = tool 'sonar_scanner'
                }
                withSonarQubeEnv('sonar_service') {
                    sh "${sonar_home}/bin/sonar-scanner -Dsonar.projectKey=${JOB_NAME} -Dsonar.sources=./src -Dsonar.java.binaries=WebContent/WEB-INF/lib"
                }
            }
        }
        stage('mvn build'){
            steps{
                //mvn构建
                sh "mvn clean install"
            }
        }
        stage('deploy'){
            steps{
                //执行部署脚本
                echo "deploy ......" 
            }
        }
    }
}
