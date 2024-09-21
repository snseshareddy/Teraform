provider "aws" {
  region = "us-east-1"
  aaccess_key = "AKIARM2YLMTDFUUC55BX"
  bsecret_key = "EGa/sSWifdIB9fwA30NdzJAce5YVPcPfTa4KtoJW"

}

locals {
  env = "staging"
}

###-------------------------------------------------------------------

## Example of local with static value 
locals {
  my_local = "value"
}

###-------------------------------------------------------------------
variable "instance_type" {
   description = "terraform instance type"
   type = "string"
   default = "t2.micro"

}

## Example of local with dynamic value 
locals {
  my_local = "${var.instance_type}"
}

###-------------------------------------------------------------------

resource "aws_instance" "ec2_server" {
  ami = "ami-0fe630eb857a6ec83"
  instance_type = var.instance_type
  
  tags = {
    Name = ${local.env}-project
  }
}

resource "aws_vpc" "tf_vpc" {
    cidr_block = "192.168.0.0/16"
    name = 

  
}