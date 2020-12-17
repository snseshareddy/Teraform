provider "aws" {
        version = "~> 2.0"
        access_key = var.access_key 
        secret_key = var.secret_key 
        region     = var.region
}
# create an instance
resource "aws_instance" "CreateInstance" {
  ami             = lookup(var.amis, var.region) 
  subnet_id       = var.subnet 
  security_groups = var.securityGroups 
  key_name        = var.keyName 
  instance_type   = var.instanceType  # Name the instance
  tags = {
    Name = var.instanceName
  }  

  # Name the volumes (will name all volumes included in the 
  # ami for this instance)
  volume_tags = {
    Name = var.instanceName
  }
}
# end resource
