module "network" {
  source = "./modules/network"

  APP_NAME   = var.APP_NAME
  STAGE      = var.STAGE
  AWS_REGION = var.AWS_REGION
}

module "security" {
  source = "./modules/security"

  APP_NAME = var.APP_NAME
  STAGE    = var.STAGE
  VPC_ID   = module.network.main-vpc-id
}

module "database" {
  source             = "./modules/database"
  APP_NAME           = var.APP_NAME
  STAGE              = var.STAGE
  DB_SUBNETS         = module.network.public-subnet-ids
  DB_USERNAME        = var.DB_USERNAME
  DB_PASSWORD        = var.DB_PASSWORD
  DB_NAME            = var.DB_NAME
  DB_SECURITY_GROUPS = [module.security.db-security-group]
  DB_AZ              = "${var.AWS_REGION}a"
}

module "cluster" {
  source = "./modules/cluster"

  APP_NAME                               = var.APP_NAME
  STAGE                                  = var.STAGE
  PUBLIC_SUBNET_IDS                      = module.network.public-subnet-ids
  PRIVATE_SUBNET_IDS                     = module.network.private-subnet-ids
  EKS_CLUSTER_IAM_ROLE                   = module.security.eks-cluster-role-arn
  EKS_NODE_GROUP_IAM_ROLE                = module.security.eks-node-group-role-arn
  EKS_CLUSTER_IAM_POLICY_ATTACHMENT      = module.security.eks-cluster-role-policy-attachment
  EKS_WORKER_NODES_POLICY_ATTACHMENT     = module.security.eks-node-group-policy-attachment
  EKS_WORKER_NODES_CNI_POLICY_ATTACHMENT = module.security.eks-node-group-cni-policy-attachment
  EKS_ECR_POLICY_ATTACHMENT              = module.security.eks-ecr-policy-attachment
}

module "storage" {
  source   = "./modules/storage"
  APP_NAME = var.APP_NAME
  STAGE    = var.STAGE
}
