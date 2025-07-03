terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "~> 3.1"
    }
  }

  backend "s3" {
    bucket = "terraform-bucket-aj" # IMPORTANT: Replace this with the name of the S3 bucket you create manually
    key    = "devops_pipelines/terraform.tfstate"
    region = "us-east-1"
  }
}

provider "aws" {
  region = "us-east-1"
}

resource "random_pet" "bucket_name" {
  prefix = "my-unique-bucket-2025-07-02"
  length = 4
}

resource "aws_s3_bucket" "b" {
  bucket = random_pet.bucket_name.id

  tags = {
    Name        = "My bucket"
    Environment = "Dev"
  }
}
