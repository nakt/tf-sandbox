variable "name" {}
variable "vpc_id" {}
variable "ingress_cidr_blocks" {}

variable "tags" {
  default = {}
}

variable "ingress_rules" {
  default = ["http-80-tcp", "https-443-tcp", "ssh-tcp"]
}
