resource "aws_iam_group" "reader" {
  name = "${var.group_name_prefix}_Reader${var.env_suffix}"
}

resource "aws_iam_group" "contributor" {
  name = "${var.group_name_prefix}_Contributor${var.env_suffix}"
}

resource "aws_iam_group" "owner" {
  name = "${var.group_name_prefix}_Owner${var.env_suffix}"
}

resource "aws_iam_group" "cost_reader" {
  name = "${var.group_name_prefix}_CostReader${var.env_suffix}"
}
