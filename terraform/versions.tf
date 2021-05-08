terraform {
  required_version = ">= 0.12"
  backend "s3" {
    bucket = "tf-poc-remote-state-bm12345"
    key    = "internal-app"
    region = "us-west-2"
  }
  required_providers {
    aws = {
      source = "hashicorp/aws"
    }
  }
}
