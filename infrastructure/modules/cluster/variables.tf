variable "APP_NAME" {
  type = string
}

variable "STAGE" {
  type = string
}

variable "PUBLIC_SUBNET_IDS" {
  type = list(string)
}

variable "PRIVATE_SUBNET_IDS" {
  type = list(string)
}

variable "EKS_CLUSTER_IAM_ROLE" {
  type = string
}

variable "EKS_NODE_GROUP_IAM_ROLE" {
  type = string
}

variable "EKS_CLUSTER_IAM_POLICY_ATTACHMENT" {
  type = any
}

variable "EKS_WORKER_NODES_POLICY_ATTACHMENT" {
  type = any
}

variable "EKS_WORKER_NODES_CNI_POLICY_ATTACHMENT" {
  type = any
}

variable "EKS_ECR_POLICY_ATTACHMENT" {
  type = any
}

variable "EKS_WORKER_NODE_INSTANCE_TYPE" {
  type    = string
  default = "t3.small"
}

variable "EKS_CLUSTER_MIN_SIZE" {
  type    = number
  default = 1
}

variable "EKS_CLUSTER_MAX_SIZE" {
  type    = number
  default = 2
}

variable "EKS_CLUSTER_DESIRED_SIZE" {
  type    = number
  default = 1
}
