# rbactonomics
RBAC decoded like a genome — mapping roles, permissions, and policies with the precision of gene expression in secure systems.

# AWS RBAC Terraform Module

This Terraform module sets up **Role-Based Access Control (RBAC)** in AWS using IAM groups, IAM policies, and IAM roles. It allows you to manage access for different user types (e.g., Reader, Contributor, Owner, CostReader) and optionally define roles that can be assumed by specific groups.

---

## 🔧 What It Creates

- IAM Groups:
  - `Reader` – Read-only access
  - `Contributor` – PowerUser access
  - `Owner` – Full admin access
  - `CostReader` – Billing-only access
- IAM Role:
  - EC2 role with read-only permissions (can be assumed by Contributors)
- IAM Policies:
  - Attach AWS-managed policies to the groups
  - Allow Contributors to assume the EC2 role

---

## 📁 Module Structure
aws-rbac/
├── version.tf # Provider versions
├── variables.tf # Input variables
├── groups.tf # IAM groups
├── policies.tf # Attach policies to groups
├── role.tf # IAM role for EC2
├── assume-role-policy.tf # Allow group to assume role
├── outputs.tf # Outputs (group names, role names)


environments/
├── dev.tfvars
├── prod.tfvars


├── main.tf
├── variables.tf


---

## ⚙️ Input Variables

| Name              | Description                                      | Type   | Default   |
|-------------------|--------------------------------------------------|--------|-----------|
| `test_suffix`      | Suffix for names in test deployments             | string | `""`      |
| `group_name_prefix`| Prefix for IAM group and role names              | string | **(required)** |
| `env_suffix`       | Optional environment suffix for tagging or naming| string | `""`      |

---

## 📤 Outputs

| Name             | Description                       |
|------------------|-----------------------------------|
| `iam_group_names`| Map of created IAM group names    |
| `ec2_role_name`  | Name of the created EC2 IAM role  |

---

## 🚀 Usage

### Example `main.tf`

```hcl
module "rbac" {
  source             = "./modules/aws-rbac"
  group_name_prefix  = "DevApp"
  env_suffix         = "-dev"
}


terraform plan -var-file="environments/dev.tfvars"
terraform apply -var-file="environments/dev.tfvars"