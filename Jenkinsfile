
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
                archiveArtifacts artifacts: "build/*.hex", onlyIfSuccessful: true
                archiveArtifacts artifacts: "build/*-eeprom.hex", onlyIfSuccessful: true
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
