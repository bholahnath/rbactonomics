module "aws_rbac" {
  source         = "./rbac"
  env_suffix    = "-dev"
  group_name_prefix = "MyApp"
}
