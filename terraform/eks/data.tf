data "aws_eks_cluster_auth" "this" {
  name = aws_eks_cluster.this.name
}

data "tls_certificate" "this" {
  url = aws_eks_cluster.this.identity[0].oidc[0].issuer
}
