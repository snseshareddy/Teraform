provider "aws" {
  region = "us-east-1"
  aaccess_key = "AKIARM2YLMTDFUUC55BX"
  bsecret_key = "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"

}

resource "aws_instance" "ec2_server" {
  ami = "ami-0fe630eb857a6ec83"
  instance_type = var.instance_type
  count = var.instance_count
  associate_public_ip_address = var.enable_public_ip
  tags = var.project_environ

}

resource "aws_iam_user" "tf_suer" {
  count = length(var.user_names)
  name = var.user_names[count.index]

}