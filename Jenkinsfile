pipeline {
    agent any
    environment {
        // z/OSMF Connection Details
        ZOWE_OPT_HOST=credentials('eosHost')
    }
    stages {
        stage('local setup') {
            steps {
                bat 'node --version'
                bat 'npm --version'
                // bat 'npm install @zowe/cli@zowe-v1-lts -g'
                bat 'zowe --version'
                //bat 'zowe plugins list'
                //bat 'npm install gulp-cli -g'
                //bat 'npm install'
            }
        }
        stage('Cast_QA') {
            steps {
                withCredentials([usernamePassword(credentialsId: 'eosCreds', usernameVariable: 'ZOWE_OPT_USER', passwordVariable: 'ZOWE_OPT_PASSWORD')]) {
                    echo 'C:\\Users\\dr891415\\Git\\KBC\\Cast_Exec_Summay_MARBLE29.pdf'
                }
            }
        }
        stage('Upload_Cobol_SRC') {
            steps {
                withCredentials([usernamePassword(credentialsId: 'eosCreds', usernameVariable: 'ZOWE_OPT_USER', passwordVariable: 'ZOWE_OPT_PASSWORD')]) {
                    bat 'upload'
                }
            }
        }
        stage('ZMF_Checkin') {
            steps {
                withCredentials([usernamePassword(credentialsId: 'eosCreds', usernameVariable: 'ZOWE_OPT_USER', passwordVariable: 'ZOWE_OPT_PASSWORD')]) {
                    bat 'checkin'
                }
            }
        }
        stage('ZMF_Build') {
            steps {
                withCredentials([usernamePassword(credentialsId: 'eosCreds', usernameVariable: 'ZOWE_OPT_USER', passwordVariable: 'ZOWE_OPT_PASSWORD')]) {
                    bat 'build'
                }
            }
        }
        stage('ZMF_Promote') {
            steps {
                withCredentials([usernamePassword(credentialsId: 'eosCreds', usernameVariable: 'ZOWE_OPT_USER', passwordVariable: 'ZOWE_OPT_PASSWORD')]) {
                    bat 'promote'
                }
            }
        }
    }
}