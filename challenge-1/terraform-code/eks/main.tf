data "aws_vpc" "vpc" {
  tags = {
    Name = var.vpc_name
  }
}

data "aws_subnet_ids" "node_subnets" {
  vpc_id = data.aws_vpc.vpc.id

  tags = {
    Name = "${var.universe_name}_${var.context}_*"
  }
}

data "aws_kms_alias" "eks" {
  name = var.kms_name
}


data "aws_iam_role" "eks_role"{
  name = var.eks_cluster_role_name
}

resource "aws_eks_cluster" "aws_eks" {
  name                 = var.cluster_name
  role_arn              = data.aws_iam_role.eks_role.arn


  vpc_config {
    subnet_ids              = data.aws_subnet_ids.node_subnets.ids
    security_group_ids      = [aws_security_group.cluster.id]
    endpoint_private_access = true
    public_access_cidrs     = var.public_access_cidrs
  }

  encryption_config {
    resources = ["secrets"]
    provider {
      key_arn = data.aws_kms_alias.eks.arn
    }
  }

  kubernetes_network_config {
    service_ipv4_cidr = var.services_cidr
  }

  tags = {
    Name = var.cluster_name
  }

  enabled_cluster_log_types = ["api", "authenticator", "audit", "scheduler", "controllerManager"]
}

resource "aws_eks_addon" "eks_vpc_cni_addon" {
  count        = var.enable_vpc_cni_addon == true ? 1 : 0
  addon_name   = "vpc-cni"
  cluster_name = aws_eks_cluster.aws_eks.name
}

#Node Group

data "aws_iam_role" "eks_node_role"{
  name = var.eks_node_group_role_name
}

resource "aws_eks_node_group" "node" {
  for_each        = var.node_group
  cluster_name    = aws_eks_cluster.aws_eks.name
  node_group_name = each.value.node_group_name
  node_role_arn   = data.aws_iam_role.eks_node_role.arn
  subnet_ids      = data.aws_subnet_ids.node_subnets.ids
  #ami_type        = var.imageid
  instance_types = each.value.instance_family


  scaling_config {
    desired_size = each.value.desired_size
    max_size     = each.value.max_size
    min_size     = each.value.min_size
  }
  tags = {
    Name                                                        = "${var.cluster_name}-node-group"
    "k8s.io/cluster-autoscaler/${aws_eks_cluster.aws_eks.name}" = "owned"
    "k8s.io/cluster-autoscaler/enabled"                         = "TRUE"
    "kubernetes.io/cluster/eks"                                 = "owned"
  }
}

#-----------------
#worker cluster security group for eks
resource "aws_security_group" "cluster" {
  name        = "${var.cluster_name}-cluster-security-group"
  description = "EKS cluster security group."
  vpc_id      = data.aws_vpc.vpc.id
  tags = {
    Name = "${var.cluster_name}-eks-cluster-sg"
  }
}

resource "aws_security_group_rule" "cluster_egress_internet" {
  description       = "Allow cluster egress access to the Internet."
  protocol          = "-1"
  security_group_id = aws_security_group.cluster.id
  cidr_blocks       = var.cluster_egress_cidrs
  from_port         = 0
  to_port           = 0
  type              = "egress"
}

resource "aws_security_group_rule" "cluster_https_worker_ingress" {
  description              = "Allow pods to communicate with the EKS cluster API."
  protocol                 = "tcp"
  security_group_id        = aws_security_group.cluster.id
  source_security_group_id = aws_security_group.cluster.id
  from_port                = 443
  to_port                  = 443
  type                     = "ingress"
}

resource "aws_security_group_rule" "cluster_https_internal_nodes_ingress" {
  description       = "Allow internal nodes to communicate with the EKS cluster API."
  protocol          = "tcp"
  security_group_id = aws_security_group.cluster.id
  cidr_blocks       = var.nodes_cidrs
  from_port         = 443
  to_port           = 443
  type              = "ingress"
}

resource "aws_security_group_rule" "allow_rds_database_port" {
  description       = "Allow rds database connection access to eks."
  protocol          = "tcp"
  security_group_id = aws_security_group.cluster.id
  cidr_blocks       = var.vpc_cidr
  from_port         = 5432
  to_port           = 5432
  type              = "ingress"
}