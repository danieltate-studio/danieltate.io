pipeline {
  agent {
      label 'jenkins-jenkins-agent'
  }

  stages {
    stage('Checkout') {
      steps {
        checkout scm
      }
    }

    stage('Build Image') {
      steps {
        sh 'docker build -t danieltate888/personal-website:latest .'
      }
    }

    stage('Push Image') {
      steps {
        withCredentials([string(credentialsId: 'dockerhub-token', variable: 'DOCKER_TOKEN')]) {
          sh 'echo "$DOCKER_TOKEN" | docker login -u danieltate888 --password-stdin'
          sh 'docker push danieltate888/personal-website:latest'
        }
      }
    }

    stage('Deploy') {
      steps {
        sh 'just deploy'
      }
    }
  }
}