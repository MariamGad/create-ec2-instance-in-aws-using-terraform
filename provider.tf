terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region = "us-west-1"
}

terraform {
    backend "s3" {
    bucket = "bucket-mariam"
    key    = "terraform.tfstate"
    region = "eu-north-1"
  }
}
