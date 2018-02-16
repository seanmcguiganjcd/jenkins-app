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
    }
}
