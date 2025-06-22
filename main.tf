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
}

provider "aws" {
  region = "us-east-1"
}

resource "random_pet" "bucket_name" {
  prefix = "my-unique-bucket"
  length = 4
}

resource "aws_s3_bucket" "b" {
  bucket = random_pet.bucket_name.id

  tags = {
    Name        = "My bucket"
    Environment = "Dev"
  }
}
