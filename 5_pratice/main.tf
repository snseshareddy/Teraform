# Aws connectivity and region where your infra to be
provider "aws" {
  # maethod-1 : Pass Aws access key and secret key as values 
  #access_key = "var.aws_access_key"
  #secret_key = "var.aws_secret_key"

  #Method-2 : Pass aws credential file as value.
  shared_credentials_file = var.aws_credentails_file
  profile                 = var.aws_credentails_profile

  # Region where you want to create your infra
  region = var.aws_region
  
}
# aws vpc creation
resource "aws_vpc" "tf_aws_vpc" {
   cidr_block           =  var.aws_vpc["cidrblock"]
   instance_tenancy     =  var.aws_vpc["instance_tenancy"]
   enable_dns_support   =  var.aws_vpc["dns_support"]
   enable_dns_hostnames =  var.aws_vpc["dns_hostnames"]

 tags = {
   #Name                 = "Terraform-aws-VPC" 
    Name                 = "VPC-${var.aws_vpc["tag"]}"
 }


}

# aws Internet gateway Creation
resource "aws_internet_gateway" "tf_aws_ig" {
   vpc_id   = aws_vpc.tf_aws_vpc.id
 
 tags = {
   Name    =  "Terraform-aws-IG"   
 }
}

# aws Public Subnet Creation
resource "aws_subnet"  "tf_aws_pub_subnet" {
 vpc_id   = aws_vpc.tf_aws_vpc.id
 cidr_block = var.aws_pub_subnet["cidrblock"]
 map_public_ip_on_launch = var.aws_pub_subnet["map_public_ip"]
 availability_zone  = var.aws_pub_subnet["availability_zone"]
 
 tags = {
    Name   = var.aws_pub_subnet["tag"]
 }
}


# aws Route table creation and Edit route to add IGW 
resource "aws_route_table" "tf_aws_routetable" {
  vpc_id   = aws_vpc.tf_aws_vpc.id
 
 route {
  cidr_block  = var.aws_routetable["cidrblock"]
  gateway_id  = aws_internet_gateway.tf_aws_ig.id

 }

 tags = {
    Name   =  var.aws_routetable["tag"]
 }

}

# aws Route Table and subnet association
resource "aws_route_table_association" "tf_aws_route_subnet" {
 subnet_id      = aws_subnet.tf_aws_pub_subnet.id
 route_table_id = aws_route_table.tf_aws_routetable.id
}



# aws Key Pair creation
resource "aws_key_pair" "tf_aws_keypair" {
  key_name    = "tf_KeyPair"
 #public_key  = " # paste id_rsa.pub content here # "
  public_key  = file("../aws_keys/aws-terraform.pub")
  #public_key  = var.aws_public_key
}



