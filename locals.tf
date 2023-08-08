locals {
  config = yamldecode(file("${path.module}/config/config.yaml"))
}