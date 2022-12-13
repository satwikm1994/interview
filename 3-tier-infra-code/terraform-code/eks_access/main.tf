terraform {
  backend "gcs" {}
}

data "aws_eks_cluster_auth" "cluster_auth" {
  name = var.cluster_name
}

data "aws_eks_cluster" "cluster_details" {
  name = var.cluster_name
}

provider "kubernetes" {
  host                   = data.aws_eks_cluster.cluster_details.endpoint
  cluster_ca_certificate = base64decode(data.aws_eks_cluster.cluster_details.certificate_authority.0.data)
  //   data.aws_eks_cluster.cluster_details.certificate_authority.0.data
  token = data.aws_eks_cluster_auth.cluster_auth.token
  //   load_config_file       = false
}

resource "kubernetes_config_map" "aws_auth_configmap" {
  metadata {
    name      = "aws-auth"
    namespace = "kube-system"
  }
  data = {
    mapUsers = yamlencode(local.test)
  }
}

locals {
  test = {
    rolearn  = "${var.user_arn}"
    username = "kubectl-access-user"
    groups = [
      "system:masters"
    ]
  }
}