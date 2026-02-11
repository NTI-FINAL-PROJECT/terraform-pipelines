# Terraform Infrastructure for DevOps Project

This directory contains the Terraform configuration to provision a complete AWS infrastructure for the project, including EKS, RDS, ECR, and networking components.

## 🏗️ Architecture Modules

The project is modularized into the following components:

| Module | Description |
|--------|-------------|
| **`vpc`** | Provisions the networking layer: VPC, Public/Private Subnets, NAT Gateway, Internet Gateway, and Route Tables. |
| **`eks`** | Deploys the Amazon EKS cluster, managed node groups, and associated IAM roles. |
| **`rds`** | Provisions an Amazon RDS PostgreSQL database in private subnets, secured with security groups allowing access only from EKS nodes. |
| **`ecr`** | Creates an Amazon Elastic Container Registry (ECR) for storing Docker images. |
| **`argocd`** | Deploys ArgoCD for GitOps-style continuous delivery. |
| **`ingress`** | Configuration for NGINX Ingress Controller (available as a module). |

## 🚀 Usage

### Prerequisites

- [Terraform](https://www.terraform.io/) installed (v1.0+)
- AWS Credentials configured (~/.aws/credentials or environment variables)

### Configuration

You verify the default values in `variables.tf`. The following variables are available:

| Variable | Default | Description |
|----------|---------|-------------|
| `aws_region` | `us-east-1` | AWS Region to deploy resources. |
| `cluster_name` | `devops-eks` | Name of the EKS cluster. |
| `vpc_cidr` | `10.0.0.0/16` | CIDR block for the VPC. |
| `public_subnets` | `["10.0.1.0/24", "10.0.2.0/24"]` | List of public subnet CIDRs. |
| `private_subnets` | `["10.0.101.0/24", "10.0.102.0/24"]` | List of private subnet CIDRs. |
| **`allowed_public_ip`** | **REQUIRED** | Your public IP address (CIDR format, e.g., `1.2.3.4/32`) to allow secure access to the EKS API endpoint. |

### Deployment Steps

1.  **Initialize Terraform**:
    ```bash
    terraform init
    ```

2.  **Plan the Deployment**:
    You must provide your IP for the `allowed_public_ip` variable.
    ```bash
    terraform plan -var="allowed_public_ip=YOUR_IP/32"
    ```

3.  **Apply Changes**:
    ```bash
    terraform apply -var="allowed_public_ip=YOUR_IP/32" --auto-approve
    ```

4.  **Configure `kubectl`**:
    After successful application, update your local kubeconfig:
    ```bash
    aws eks update-kubeconfig --region us-east-1 --name devops-eks
    ```

## 🧹 Cleanup

To destroy all resources:
```bash
terraform destroy -var="allowed_public_ip=YOUR_IP/32" --auto-approve
```
