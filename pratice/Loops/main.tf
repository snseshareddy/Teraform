
provider "aws" {
  region = "us-east-1"
  aaccess_key = "AKIARM2YLMTDFUUC55BX"
  bsecret_key = "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"

}

variable "iam_users" {
  description = "map"
  type        = map(string)
  default     = {
    user1      = "normal user"
    user2  = "admin user"
    user3 = "root user"
  }
}

output "user_with_roles" {
  value = [for name, role in var.iam_users : "${name} is the ${role}"]
}
