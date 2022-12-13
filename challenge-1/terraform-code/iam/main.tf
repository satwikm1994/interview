##-----------> instance profile roles <---------------##

data "aws_iam_policy_document" "instance_assume_role_policy" {
  statement {
    actions = ["sts:AssumeRole"]
    effect  = "Allow"

    principals {
      type        = "Service"
      identifiers = var.identifiers
    }
  }
}
resource "aws_iam_role" "iam_role" {
  name                = var.instance_profile_role
  assume_role_policy  = data.aws_iam_policy_document.instance_assume_role_policy.json
  managed_policy_arns = var.managed_policy_arns
}

resource "aws_iam_instance_profile" "interview_profile" {
  name = var.instance_profile_name
  role = aws_iam_role.iam_role.name
}

##----------> eks autoscaling node group policy <----------------##

resource "aws_iam_policy" "cluster_autoscaling" {
  count       = var.eks_node ? 1 : 0
  name = var.eks_node_policy_name

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = [
          "autoscaling:DescribeAutoScalingGroups",
          "autoscaling:DescribeAutoScalingInstances",
          "autoscaling:DescribeLaunchConfigurations",
          "autoscaling:DescribeTags",
          "autoscaling:SetDesiredCapacity",
          "autoscaling:TerminateInstanceInAutoScalingGroup",
          "ec2:DescribeLaunchTemplateVersions"
        ]
        Effect   = "Allow"
        Resource = "*"
      },

    ]
  })
}

resource "aws_iam_role_policy_attachment" "AmazonEKSClusterAutoscalingPolicy" {
  count       = var.eks_node ? 1 : 0
  policy_arn = aws_iam_policy.cluster_autoscaling[0].arn
  role       = aws_iam_role.iam_role.name
  depends_on = [aws_iam_policy.cluster_autoscaling]
}
