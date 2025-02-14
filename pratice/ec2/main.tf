
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