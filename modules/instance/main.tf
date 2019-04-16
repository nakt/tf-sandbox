module "ec2" {
  source = "terraform-aws-modules/ec2-instance/aws"

  instance_count              = "${var.instance_count}"
  name                        = "${var.name}"
  ami                         = "${var.ami}"
  instance_type               = "${var.instance_type}"
  key_name                    = "${var.key_name}"
  associate_public_ip_address = true
  monitoring                  = false
  vpc_security_group_ids      = ["${var.vpc_security_group_ids}"]
  subnet_id                   = "${var.subnet_id}"
  tags                        = "${var.tags}"
  user_data                   = "${file("${path.module}/../../userdata/${var.user_data}.sh")}"
}
