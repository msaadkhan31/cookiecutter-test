resource "aws_route53_record" "blue" {
  zone_id  = "${var.r53_zone_id}"
  name     = "${var.service_url}"
  type     = "CNAME"
  ttl      = "10"

  weighted_routing_policy {
    weight = "${var.blue_weight}"
  }

  set_identifier = "blue"
  records        = ["${var.blue_beanstalk_cname}"]
}

resource "aws_route53_record" "green" {
zone_id  = "${var.r53_zone_id}"
name     = "${var.service_url}"
type     = "CNAME"
ttl      = "10"

weighted_routing_policy {
  weight = "${var.green_weight}"
}

set_identifier = "green"
records        = ["${var.green_beanstalk_cname}"]
}

output "blue_weight" {
  value = "${aws_route53_record.blue.weighted_routing_policy.0.weight}"
}


output "green_weight" {
  value = "${aws_route53_record.green.weighted_routing_policy.0.weight}"
}
