terraform {
  required_version = ">= 1.5.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.62.0"
    }
  }
}

provider "aws" {
  region = "ap-south-1" # Mumbai
  default_tags {
    tags = {
      created_by  = "Akhil"
      project     = "Project-4.2"
      Environment = terraform.workspace
    }
  }
}
