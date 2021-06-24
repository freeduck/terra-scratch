locals {
  ns_ilm_json  = jsonencode({
    policy = {
      phases = {
        delete = {
          min_age = "10d"
        }
      }
    }
  })
  rendered_yaml = templatefile("${path.module}/test.yaml")
}

output "yaml" {
  value = local.rendered_yaml
}
