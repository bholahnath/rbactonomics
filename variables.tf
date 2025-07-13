variable "group_name_prefix" {
  description = "Prefix for IAM group and role names."
  type        = string
}

variable "env_suffix" {
  description = "Environment suffix used for naming or tagging."
  type        = string
  default     = ""
}
