# ECR

resource "aws_ecr_repository" "ecr-repository" {
  name = "${var.APP_NAME}-ecr-repository-${var.STAGE}"
}

# EKS cluster & node group

resource "aws_eks_cluster" "eks-cluster" {
  name     = "${var.APP_NAME}-eks-cluster-${var.STAGE}"
  role_arn = var.EKS_CLUSTER_IAM_ROLE

  vpc_config {
    subnet_ids = concat(var.PUBLIC_SUBNET_IDS, var.PRIVATE_SUBNET_IDS)
  }

  depends_on = [var.EKS_CLUSTER_IAM_POLICY_ATTACHMENT]
}

resource "aws_eks_node_group" "eks-cluster-private-node-group" {
  cluster_name    = aws_eks_cluster.eks-cluster.name
  node_group_name = "${var.APP_NAME}-eks-cluster-node-group-${var.STAGE}"
  node_role_arn   = var.EKS_NODE_GROUP_IAM_ROLE

  subnet_ids = var.PUBLIC_SUBNET_IDS

  capacity_type  = "ON_DEMAND"
  instance_types = [var.EKS_WORKER_NODE_INSTANCE_TYPE]

  scaling_config {
    desired_size = var.EKS_CLUSTER_DESIRED_SIZE
    max_size     = var.EKS_CLUSTER_MAX_SIZE
    min_size     = var.EKS_CLUSTER_MIN_SIZE
  }

  update_config {
    max_unavailable = 1
  }

  depends_on = [
    var.EKS_WORKER_NODES_POLICY_ATTACHMENT,
    var.EKS_WORKER_NODES_CNI_POLICY_ATTACHMENT,
    var.EKS_ECR_POLICY_ATTACHMENT,
  ]
}
