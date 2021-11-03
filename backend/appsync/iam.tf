resource "aws_iam_role" "appsync_role" {
  name               = "${var.project_name}-appsync-role-${data.aws_region.current.name}"
  tags               = local.tags
  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "appsync.amazonaws.com"
      },
      "Effect": "Allow"
    }
  ]
}
EOF
}

resource "aws_iam_role_policy" "appsync_policy" {
  name   = "${var.project_name}-appsync-policy-${data.aws_region.current.name}"
  role   = aws_iam_role.appsync_role.id
  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": [
        "dynamodb:*"
      ],
      "Effect": "Allow",
      "Resource": [
        "*"
      ]
    }
  ]
}
EOF
}
