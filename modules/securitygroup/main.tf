module "security_group" {
  source = "terraform-aws-modules/security-group/aws"

  name                = "${var.vpc_id}"
  description         = "Security group for workspace with HTTP/HTTPS/ssh ports open within VPC"
  vpc_id              = "${var.vpc_id}"
  ingress_cidr_blocks = ["${var.ingress_cidr_blocks}"]
  ingress_rules       = ["${var.ingress_rules}"]
  egress_rules        = ["all-all"]
  tags                = "${var.tags}"
}
