
variable "env_name" {
  type = "map"
}

variable "application_name" {
  type = "map"
}

variable "solution_stack" {
  type = "map"
}
variable "version_label" {
  type = "map"
}

variable "env" {
}

variable "asg_instance_type" {
 type = "map"
}

variable "instance_profile" {
 type = "map"
}

variable "security_group" {
 type = "map"
}

variable "service_role" {
 type = "map"
}

variable "batchtype" {
  default = "Fixed"
}

variable "batchsize" {
  default = "1"
}

variable "deployment_policy" {
  default = "Rolling"
}

variable "mandatory_tags" {
  default = {
    "careem:tier"        = "testing"
    "careem:team"        = "devops"
    "careem:criticality" = "medium"
    "careem:vpc"         = "qa-vpc"
  }
}

variable "key_pair" {
  type = "map"
}

variable "asg_capacity" {
  type = "map"
}

variable "asg_zones" {
  type = "map"
}

variable "vpc_id" {
  type = "map"
}

variable "elb_scheme" {
  default = "Internal"
}

variable "elb_subnets" {
  type = "map"
}

variable "ec2_subnets" {
  type = "map"
}

variable "load_balancer_type" {
}

variable "beanstalk_env_variable_keys" {
  type = "map"
}

variable "beanstalk_env_variable_values" {
  type = "map"
}

variable "additional_environment_variables" {
  default = {
  }
}

