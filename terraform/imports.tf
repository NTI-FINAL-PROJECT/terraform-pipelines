import {
  to = module.eks.aws_iam_role.eks_cluster
  id = "eks-cluster-role"
}

import {
  to = module.eks.aws_iam_role.eks_nodes
  id = "eks-node-role"
}

import {
  to = module.rds.aws_db_subnet_group.rds
  id = "backend-db-subnet-group"
}
