terraform {
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
      created_by = "Akhil"
      project    = "Project-4.1"
    }
  }
}
