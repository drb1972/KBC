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
                bat 'hostname'
                bat 'zowe profiles create zosmf Jenkins --port 443 --ru false --host dummy --user dummy --password dummy --ow'
            }
        }
        stage('QA') {
            steps {
                withCredentials([usernamePassword(credentialsId: 'eosCreds', usernameVariable: 'ZOWE_OPT_USER', passwordVariable: 'ZOWE_OPT_PASSWORD')]) {
                    echo 'C:\\Users\\dr891415\\Wokshop\\Zowe_CHM_Sample01\\Cast_Exec_Summay_MARBLE29.pdf'
                }
            }
        }
        stage('Upload Program') {
            steps {
                withCredentials([usernamePassword(credentialsId: 'eosCreds', usernameVariable: 'ZOWE_OPT_USER', passwordVariable: 'ZOWE_OPT_PASSWORD')]) {
                    bat 'rexx upload'
                }
            }
        }
        stage('Checkin') {
            steps {
                withCredentials([usernamePassword(credentialsId: 'eosCreds', usernameVariable: 'ZOWE_OPT_USER', passwordVariable: 'ZOWE_OPT_PASSWORD')]) {
                    bat 'rexx checkin'
                }
            }
        }
        stage('Build') {
            steps {
                withCredentials([usernamePassword(credentialsId: 'eosCreds', usernameVariable: 'ZOWE_OPT_USER', passwordVariable: 'ZOWE_OPT_PASSWORD')]) {
                    bat 'rexx build'
                }
            }
        }
        stage('Promote') {
            steps {
                withCredentials([usernamePassword(credentialsId: 'eosCreds', usernameVariable: 'ZOWE_OPT_USER', passwordVariable: 'ZOWE_OPT_PASSWORD')]) {
                    bat 'rexx promote'
                }
            }
        }
    }
}