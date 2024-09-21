variable "instance_type" {
   description = "terraform instance type"
   type = string
   default = "t2.micro"

}

variable "instance_count" {
  description = "count instances"
  type = number
  default = 3

}

variable "enable_public_ip"{
  description = "enable public ip"
  type = bool
  default = true
}

variable "user_names"{
    description = "iam usernames"
    type = list(string)
    default = ["user1", "user2", "user3"]
}

variable "project_environ" {
    description = "Porject name and environment"
    type = map(string)
    default = {
        project = "Automate"
        environment = "dev"
    }
  
}