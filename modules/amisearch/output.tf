output "ubuntu" {
  value = "${data.aws_ami.ubuntu.id}"
}

output "amazon_linux_2" {
  value = "${data.aws_ami.amazon_linux_2.id}"
}
