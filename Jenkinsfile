pipeline {
  agent any
  // tools {
  //   // This name must match the name you gave the tool in Global Tool Configuration
  //   terraform 'Default-Terraform'
  // }
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
        input 'Approve to DESTROY existing infrastructure?'
        sh 'terraform destroy -auto-approve'
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