terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.11.0"
    }
  }
  backend "s3" {
    bucket = "capstone-assign"
    key    = "terraform.tfstate"
    region = "us-east-1"
  }
}
provider "aws" {
  # Configuration options
  region = "us-east-1"
}
