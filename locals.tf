locals {
  config        = yamldecode(file("${path.module}/config/config.yaml"))
  address_space = [var.address_space]
}