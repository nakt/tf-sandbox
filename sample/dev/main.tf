module "test" {
  source      = "../"
  sshkey_path = "${var.sshkey_path}"
}
