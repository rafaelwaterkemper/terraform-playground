provider "aws" {
  region = "sa-east-1"
}

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.4"
    }
  }

  backend "s3" {
    bucket = "waterkemper-mybucket"
    key    = "remote/state.tfstate"
    region = "sa-east-1"
  }
}
