module "label" {
  source = "git::https://github.com/cloudposse/terraform-null-label.git?ref=master"

  namespace   = "${lookup(var.label, "namespace")}"
  name        = "${lookup(var.label, "name")}"
  environment = "${lookup(var.label, "environment")}"
  stage       = "${lookup(var.label, "stage")}"
  delimiter   = "${lookup(var.label, "delimiter")}"
  attributes  = []
  tags        = "${var.tags}"
}
