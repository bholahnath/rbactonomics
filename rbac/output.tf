output "iam_group_names" {
  value = {
    reader      = aws_iam_group.reader.name
    contributor = aws_iam_group.contributor.name
    owner       = aws_iam_group.owner.name
    cost_reader = aws_iam_group.cost_reader.name
  }
}
