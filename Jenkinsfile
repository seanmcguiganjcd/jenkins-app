#!/usr/bin/env groovy

podTemplate(label: 'mypod', containers: [
    containerTemplate(name: 'docker', image: 'docker', ttyEnabled: true, command: 'cat'),
    containerTemplate(name: 'kubectl', image: 'lachlanevenson/k8s-kubectl:v1.8.0', command: 'cat', ttyEnabled: true),
    containerTemplate(name: 'helm', image: 'lachlanevenson/k8s-helm:latest', command: 'cat', ttyEnabled: true),
    containerTemplate(name: 'sops', image: 'mozilla/sops:latest', command: 'cat', ttyEnabled: true)
  ],
  volumes: [
    hostPathVolume(mountPath: '/var/run/docker.sock', hostPath: '/var/run/docker.sock'),
  ]) {
    node('mypod') {
        checkout scm

        stage('do some Docker work') {
            container('docker') {

                withCredentials([[$class: 'UsernamePasswordMultiBinding',
                        credentialsId: 'DockerHub',
                        usernameVariable: 'DOCKER_HUB_USER',
                        passwordVariable: 'DOCKER_HUB_PASSWORD']]) {
                    
                    sh """
                        docker build -t ${env.DOCKER_HUB_USER}/go_app:${env.BUILD_NUMBER} .
                        docker login -u ${env.DOCKER_HUB_USER} -p ${env.DOCKER_HUB_PASSWORD} 
                        docker push ${env.DOCKER_HUB_USER}/go_app:${env.BUILD_NUMBER}
                        """
                }
            }
        }

        stage('do some sops work') {
            container('sops') {
                {
                    sh """
                       sops -v
                       ls -l
                       pwd
                       """
                }
            }
        }

        stage('do some helm work') {
            container('helm') {

                withCredentials([[$class: 'UsernamePasswordMultiBinding', 
                        credentialsId: 'DockerHub',
                        usernameVariable: 'DOCKER_HUB_USER',
                        passwordVariable: 'DOCKER_HUB_PASSWORD']]) {
               
               sh """
                   helm upgrade -i --debug go-http ./go-http --set image.tag=${env.BUILD_NUMBER}
                   helm lint go-http
                   """

                }
            }
        }
    }
}






