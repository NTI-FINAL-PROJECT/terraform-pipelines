resource "kubernetes_namespace" "cw" {
  metadata {
    name = "amazon-cloudwatch"
  }
}

resource "kubernetes_service_account" "fluentbit" {
  metadata {
    name      = "fluent-bit"
    namespace = kubernetes_namespace.cw.metadata[0].name
    annotations = {
      "eks.amazonaws.com/role-arn" = aws_iam_role.fluentbit_role.arn
    }
  }
}
