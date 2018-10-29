provider "aws" {
  region = "eu-west-1"
}

terraform {
  backend "s3" {
    region = "eu-west-1"
    workspace_key_prefix = "statefiles"
  }
}
