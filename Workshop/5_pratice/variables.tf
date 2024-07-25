variable "aws_access_key" {
   default = ""
}
variable "aws_secret_key" {
   default = ""
}

variable "aws_credentails_file" {
}

variable "aws_credentails_profile" {
}

variable "aws_region" {
}

variable "aws_vpc" {
 type = map
}

variable "aws_pub_subnet" {
 type = map
}

variable "aws_routetable" {
 type = map
}
