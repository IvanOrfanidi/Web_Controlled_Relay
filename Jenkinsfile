// Имя выходного файла
def EXECUTABLE_FILE_NAME = "web_controlled_relay"

pipeline {
    agent any
    stages {
        stage('submodule update') {
            steps {
                sh 'git submodule init'
                sh 'git submodule update'
            }
        }

        stage('build') {
            steps {
                sh 'bash compile.sh'
            }
        }

        stage('artifacts') {
            steps {
                archiveArtifacts artifacts: "build/${EXECUTABLE_FILE_NAME}.hex", onlyIfSuccessful: true
                archiveArtifacts artifacts: "build/${EXECUTABLE_FILE_NAME}-eeprom.hex", onlyIfSuccessful: true
            }
        }

        stage('clean') {
            steps {
                cleanWs()
            }
        }
    }
    options {
        // Хранить только одну удачную сбороку
        buildDiscarder(logRotator(numToKeepStr: '1'))
    }
}
