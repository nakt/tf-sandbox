data "aws_availability_zones" "available" {}

module "vpc" {
  source = "terraform-aws-modules/vpc/aws"

  name                 = "${var.vpc_name}"
  cidr                 = "${var.vpc_cidr_block}"
  azs                  = ["${data.aws_availability_zones.available.names[0]}"]
  public_subnets       = ["${cidrsubnet(var.vpc_cidr_block, 8, 1)}"]
  enable_nat_gateway   = false
  enable_vpn_gateway   = false
  enable_dns_hostnames = true
  enable_dns_support   = true
  tags                 = "${var.tags}"
}
