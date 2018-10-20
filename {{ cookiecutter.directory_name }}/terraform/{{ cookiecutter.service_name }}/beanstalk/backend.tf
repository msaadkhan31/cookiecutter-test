terraform {
  backend "s3" {
    region = "eu-west-1"
    bucket = "iacv2-qa"
    key    = "{{ cookiecutter.service_name }}/terraform.tfstate"

    workspace_key_prefix = "statefiles"
  }
}
