pipeline {
  agent any
  environment {
    AWS_ACCESS_KEY_ID = credentials('aws-access-key-id')
    AWS_SECRET_ACCESS_KEY = credentials('aws-secret-access-key')
  }
  stages {
    stage('Checkout') {
      steps {
        git 'https://github.com/arun-jathari/devops_pipelines.git'
      }
    }
    stage('Terraform Init') {
      steps {
        sh 'terraform init'
      }
    }
    stage('Terraform Plan') {
      steps {
        sh 'terraform plan'
      }
    }
    stage('Terraform Apply') {
      steps {
        input 'Approve to apply?'
        sh 'terraform apply -auto-approve'
      }
    }
  }
}