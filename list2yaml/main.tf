locals {
  elastic_out_namespaces = [
    "cattle-logging-system",
    "default",
    "ingress-nginx"
  ]
}

data "template_file" "cluster_flow" {
  template = file("${path.module}/manifest.yaml")
  vars = {
    excluded_namespaces = join("\n", formatlist("        - %s", tolist(local.elastic_out_namespaces)))
  }
}

output "yaml" {
  value = data.template_file.cluster_flow.rendered
}
