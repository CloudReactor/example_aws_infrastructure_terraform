data "aws_region" "current" {}
data "aws_caller_identity" "current" {}

data "aws_iam_policy_document" "task-attach-policy" {
  statement {
    actions = [
      "sts:AssumeRole"
    ]

    principals {
      type = "Service"
      identifiers = [
        "ecs.amazonaws.com",
        "ecs-tasks.amazonaws.com"
      ]
    }
  }
}

resource "aws_iam_role" "default" {
  name = "${var.project_name}_task_${var.environment}"

  assume_role_policy = data.aws_iam_policy_document.task-attach-policy.json

  tags = {
    Environment = var.environment
    ManagedBy = "Terraform"
  }
}

resource "aws_iam_role_policy" "secrets_access" {
    name = "${var.project_name}_task_${var.environment}"
    role = aws_iam_role.default.id

    policy = jsonencode({
        Version = "2012-10-17"
        Statement = [
            {
                Effect = "Allow",
                Action = [
                    "secretsmanager:GetResourcePolicy",
                    "secretsmanager:GetSecretValue",
                    "secretsmanager:DescribeSecret",
                    "secretsmanager:ListSecretVersionIds"
                ],
                Resource = "arn:aws:secretsmanager:${data.aws_region.current.name}:${data.aws_caller_identity.current.account_id}:secret:${ replace(var.project_name, "-", "_") }/${var.environment}/tasks/*"
            }
        ]
    })
}
