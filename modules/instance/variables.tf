variable "instance_count" {
  default = "1"
}

variable "instance_type" {
  default = "t3.micro"
}

variable "user_data" {
  default = "default.ubuntu"
}

variable "name" {}
variable "ami" {}
variable "key_name" {}

variable "vpc_security_group_ids" {}

variable "subnet_id" {}

variable "tags" {
  default = {}
}
