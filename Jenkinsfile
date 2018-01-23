pipeline{
    agent any
    parameters {
        choice(name: 'DO_SONNAR',choices:'yes\nno', description: '是否允许Sonar-Scanner?')
    }
    stages {
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
        stage("Human: Deploy") {
            input {
                message: '构建配置'
                ok:"ok"
                parameters: [choice(name: 'DO_DEPLOY',choices: '测试环境\n生产环境',description:'选择构建环境')]
            }
            steps{
                echo '111'
                //script {
                    //timeout(time:1,unit:'HOURS'){
                        //input message: '构建配置',
                        //parameters: [choice(name: 'DO_DEPLOY',choices: '测试环境\n生产环境',description:'选择构建环境')]
                        
                    //}
                    //echo "正在部署"${DO_DEPLOY}
                //}
            }
        }
    }
}
