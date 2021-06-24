locals {
  kubeconfigexists = fileexists("${path.root}/temp/kubeconfig")
}

resource "null_resource" "kubeconfig" {

}
