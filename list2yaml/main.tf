locals {
  list = [
    "hest",
    "hjort"
  ]
}

output "yaml" {
  value = yamlencode(local.list)
}
