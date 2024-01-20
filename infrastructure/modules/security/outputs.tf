output "eks-cluster-role-arn" {
  value = aws_iam_role.eks-cluster-role.arn
}

output "eks-node-group-role-arn" {
  value = aws_iam_role.eks-node-group-role.arn
}

output "eks-cluster-role-policy-attachment" {
  value = aws_iam_role_policy_attachment.eks-cluster-policy-attachment
}

output "eks-node-group-policy-attachment" {
  value = aws_iam_role_policy_attachment.eks-worker-nodes-policy-attachment
}

output "eks-node-group-cni-policy-attachment" {
  value = aws_iam_role_policy_attachment.eks-worker-nodes-policy-attachment
}

output "eks-ecr-policy-attachment" {
  value = aws_iam_role_policy_attachment.ecr-readonly-policy-attachment
}

output "db-security-group" {
  value = aws_security_group.db-security-group.id
}
