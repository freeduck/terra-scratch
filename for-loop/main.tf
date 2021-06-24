locals {
  files = [
    "test.txt",
    "test2.txt"
  ]
  test_content = join("\n", [for f in data.template_file.test: f.rendered])
  test3 = file("${path.module}/test3.txt")
  manifests = join("\n", [
    local.test_content,
    local.test3
  ])
}

data "template_file" "test"{
  count = length(local.files)
  template = file("${path.module}/test.txt")
}

output "test"{
  value = local.manifests
}
