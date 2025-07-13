# You can use AWS managed policies or create custom ones.
# Here, i've attach AWS managed policies for simplicity
# You can also replace these with custom inline policies
# if your org requires fine-grained permissions.

resource "aws_iam_group_policy_attachment" "reader" {
  group      = aws_iam_group.reader.name
  policy_arn = "arn:aws:iam::aws:policy/ReadOnlyAccess"
}

resource "aws_iam_group_policy_attachment" "contributor" {
  group      = aws_iam_group.contributor.name
  policy_arn = "arn:aws:iam::aws:policy/PowerUserAccess"
}

resource "aws_iam_group_policy_attachment" "owner" {
  group      = aws_iam_group.owner.name
  policy_arn = "arn:aws:iam::aws:policy/AdministratorAccess"
}

resource "aws_iam_group_policy_attachment" "cost_reader" {
  group      = aws_iam_group.cost_reader.name
  policy_arn = "arn:aws:iam::aws:policy/AWSBillingReadOnlyAccess"
}
