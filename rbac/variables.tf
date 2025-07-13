variable "env_suffix" {
  description = "Suffix for each environment deployment of resources."
  type        = string
  default     = ""
}

variable "group_name_prefix" {
  description = "Prefix for IAM group names (e.g. environment or org)."
  type        = string
  default     = "RBAC"
}
