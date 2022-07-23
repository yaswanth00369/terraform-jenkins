provider "aws" {
    region = var.region
}

terraform {
  backend "s3" {
    bucket = "jenkins-yaml-tfstate-bucket"
    key    = "terraform.tfstate"
    region = "us-east-1"
    dynamodb_table = "jenkins-yaml-table"
  }
} 