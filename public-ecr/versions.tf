terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "~> 5.7.0"
    }
  }
  required_version = ">= 1.2.5"
}

provider "aws" {
  alias  = "us_east_1"
  region = "us-east-1"
}
