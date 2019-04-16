variable "label" {
  default = {
    namespace   = "nakt"    # Namespace, which could be your organization name
    environment = "private" # Environment, e.g. 'prod', 'staging', 'dev', 'pre-prod', 'UAT'
    stage       = "stg"     # Stage, e.g. 'prod', 'staging', 'dev', OR 'source', 'build', 'test', 'deploy', 'release'
    name        = "ec2"     # Solution name, e.g. 'app' or 'jenkins'
    delimiter   = "-"       # Delimiter to be used between name, namespace, stage, etc.
  }
}

variable "tags" {
  default = {
    Owner = "tetsuo.nakamura@gmail.com"
  }
}

variable "instance" {
  default = {
    count         = "10"
    instance_type = "t3.micro"
  }
}

variable "sshkey_path" {}
