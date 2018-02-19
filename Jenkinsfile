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
        stage ('Verify before deploy') {
            steps {
                input "Does the staging environment look ok?"
            }
        }
        stage ('Deploy') {
            steps {
                sh 'echo "Deploying artifact"'
            }
        }
    }
}
