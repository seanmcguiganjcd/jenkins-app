pipeline {
    agent any
    stages {
        stage('Build') {
            steps {
                sh 'echo "Hallo Welt"'
                sh '''
                   whoami
                   ./foo.sh
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

        input 'Continue to deploy stage?'

        stage ('Deploy') {
            steps {
                sh 'echo "Deploying artifact"'
            }
        }
    }
}
