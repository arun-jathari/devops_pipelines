pipeline {
  agent any
  environment {
    AWS_ACCESS_KEY_ID = credentials('aws-access-key-id')
    AWS_SECRET_ACCESS_KEY = credentials('aws-secret-access-key')
  }
  stages {
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
    stage('Terraform Destroy') {
      steps {
        echo 'Starting terraform destroy...'
        sh 'terraform destroy -auto-approve'
      }
    }
    stage('Terraform Apply') {
      steps {
        echo 'Starting terraform apply...'
        sh 'terraform apply -auto-approve'
      }
    }
  }
}
