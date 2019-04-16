resource "aws_key_pair" "ssh_key" {
  key_name   = "${module.label.id}"
  public_key = "${file(var.sshkey_path)}"
}

module "label" {
  source = "../../modules/label"
  label  = "${var.label}"
  tags   = "${var.tags}"
}

module "vpc" {
  source   = "../../modules/vpc"
  vpc_name = "${module.label.id}"
}

module "security_group" {
  source              = "../../modules/securitygroup"
  name                = "${module.label.id}"
  vpc_id              = "${module.vpc.vpc_id}"
  ingress_cidr_blocks = "${var.ingress_cidr_blocks}"
}

module "ami" {
  source = "../../modules/amisearch"
}

module "instance" {
  source                 = "../../modules/instance"
  name                   = "${module.label.id}"
  ami                    = "${module.ami.ubuntu}"
  key_name               = "${var.sshkey_path}"
  subnet_id              = "${module.vpc.public_subnets}"
  vpc_security_group_ids = "${module.security_group.security_group_id}"
}
