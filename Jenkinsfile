pipeline{
    agent any
    parameters {
        choice(name: 'DO_SONNAR',choices:'yes\nno', description: '是否允许Sonar-Scanner?')
        string(name: 'GIT_BRANCH', defaultValue: 'dev', description: '请输入需要构建的分支')
    }
    stages {
        stage('SonarQube analysis') {
            when {
                expression { DO_SONNAR == 'yes' }
                //environment name : 'env.SONNAR', value : 'yes'
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

            steps{
                script {
                    timeout(time:1,unit:'HOURS'){
                       input message: "构建配置",
                        //parameters: [name: 'DO_DEPLOY',choices: 'test\nonline',description:"选择构建环境")]
                        parameters: [choice(name: 'DO_DEPLOY', choices: '测试环境\n开发环境')]
                        //parameters: [string(name: 'DO_DEPLOY', defaultValue: 'Mr Jenkins', description: 'Who should I say hello to?')]
                    }
                }
                echo "正在构建${DO_DEPLOY}"
            }
        }
    }
}
