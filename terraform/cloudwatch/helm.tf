resource "helm_release" "fluentbit" {
  name       = "aws-for-fluent-bit"
  repository = "https://aws.github.io/eks-charts"
  chart      = "aws-for-fluent-bit"
  namespace  = kubernetes_namespace.cw.metadata[0].name

  set {
    name  = "serviceAccount.create"
    value = "false"
  }

  set {
    name  = "serviceAccount.name"
    value = "fluent-bit"
  }

  set {
    name  = "cloudWatch.region"
    value = var.region
  }

  set {
    name  = "cloudWatch.logGroupName"
    value = "/eks/application"
  }
}
