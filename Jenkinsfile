pipeline {
    agent any
    stages {
        stage('Build') {
            steps {
                sh 'echo "Hallo Welt"'
                
                sh '''
                   whoami
                   sleep 15
                
                sh '''
                
                sh '''
                    echo "Multiline shell steps works too"
                    ls -lah
                '''
            }
        }
        stage ('Test') {
            steps {
                sh 'echo "Running tests"'
            }
        }
        stage ('Deploy') {
            steps {
                sh 'echo "Deploying artifact"'
            }
        }
    }
}
