pipeline {
    agent any
    stages {
        stage('Build') {
            steps {
                sh 'echo "Hallo Welt"'
                
                sh '''
                   pwd
                   sleep 5
                   ls -l
                   ./foo.sh
                   sleep 5
                sh '''
                
                sh '''
                    echo "Multiline shell steps works too"                    
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
