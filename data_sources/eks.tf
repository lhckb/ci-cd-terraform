data "aws_eks_cluster" "this" {
  name = var.eks_cluster_name
}

data "aws_eks_cluster_auth" "this" {
  name = var.eks_cluster_name
}

data "aws_vpc" "eks_vpc" {
  id = data.aws_eks_cluster.this.vpc_config[0].vpc_id
}

data "aws_subnets" "eks_subnets" {
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.eks_vpc.id]
  }
}
data "aws_security_group" "eks_sg" {
  filter {
    name   = "group-name"
    values = ["eks-cluster-sg-eksDeepDiveFrankfurt-1978535350"]
  }

  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.eks_vpc.id]
  }
}
