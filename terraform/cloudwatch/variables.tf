variable "cluster_name" {
  type        = string
  description = "The name of the EKS cluster"
}

variable "region" {
  type        = string
  description = "The AWS region"
}

variable "oidc_provider_arn" {
  type        = string
  description = "The ARN of the OIDC provider for the EKS cluster"
}
