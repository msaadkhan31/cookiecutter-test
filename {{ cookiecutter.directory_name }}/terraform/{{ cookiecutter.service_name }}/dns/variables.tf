variable "r53_zone_id" {
  description = "ZoneID (i.e Z39HI03VCR9YB8)"
}
variable "service_url" {
  description = ""
}

variable "blue_beanstalk_cname" {
    description = "Environment CNAME"
}

variable "blue_weight" {
  default     = 0
}

variable "green_beanstalk_cname" {
    description = "Environment CNAME"
}

variable "green_weight" {
  default     = 0
}
