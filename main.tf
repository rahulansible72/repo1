terraform {
 required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}
provider "aws" {
  region = "ap-south-1"
}

locals {
  bucket_name = "s3-bucket-rahul-ibm-tf"
}

module "s3_bucket" {
  source = "terraform-aws-modules/s3-bucket/aws"
  version = "2.4.0"
  bucket        = local.bucket_name
  acl           = "private"
  force_destroy = true

#  attach_policy = true
#  policy        = data.aws_iam_policy_document.bucket_policy.json

  attach_deny_insecure_transport_policy = true

  tags = {
    Owner = "rahul"
  }

  versioning = {
    enabled = true
  }
}
