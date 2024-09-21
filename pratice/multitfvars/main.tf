
resource "aws_instance" "ec2_server" {
  ami = "ami-0fe630eb857a6ec83"
  instance_type = var.instance_type
 
  tags = {
    Name = var.project_environ
  }
}