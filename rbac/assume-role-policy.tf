data "aws_iam_policy_document" "assume_example_ec2_role" {
  statement {
    actions   = ["sts:AssumeRole"]
    resources = [aws_iam_role.example_ec2_role.arn]
  }
}

resource "aws_iam_policy" "assume_role_policy" {
  name   = "${var.group_name_prefix}_AssumeEC2Role${var.env_suffix}"
  policy = data.aws_iam_policy_document.assume_example_ec2_role.json
}

resource "aws_iam_group_policy_attachment" "contributor_assume_ec2" {
  group      = aws_iam_group.contributor.name
  policy_arn = aws_iam_policy.assume_role_policy.arn
}
