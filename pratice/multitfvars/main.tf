provider "aws" {
  region = "us-east-1"
  aaccess_key = "AKIARM2YLMTDFUUC55BX"
  bsecret_key = "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"

}

resource "aws_instance" "ec2_server" {
  ami = "ami-0fe630eb857a6ec83"
  instance_type = var.instance_type
 
  tags = {
    Name = var.project_environ
  }
}