terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.48.0"
    }
  }
  ## Backend configuration for storing Terraform state in an S3 bucket.
  ## Run Terraform init to initialize the backend after uncommenting and configuring the block below.

  # backend "s3" {
  #   bucket = "terraform-state-bucket"
  #   key    = "terraform.tfstate"
  #   region = "eu-west-2"
  # }
}

provider "aws" {
  region = "eu-west-2"
  # Configuration options
}

