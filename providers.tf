terraform {

#   cloud {
#    organization = "DevopsFuzzie"
#
#    workspaces {
#      name = "Terra-house-1"
#    }
#  }
  
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.19.0"
    }
  }
}

provider "aws" {
  # Configuration options
}

provider "random" {
  # Configuration options
}