module "test" {
  source      = "../"
  sshkey_path = "${var.sshkey_path}"
  label       = "${var.label}"
}