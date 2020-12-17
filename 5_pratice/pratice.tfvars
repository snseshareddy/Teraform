aws_credentails_file = "/Users/nseshare/.aws/credentials" 
aws_credentails_profile = "terraform"
aws_region = "us-east-1"

aws_vpc = {
 tag  = "Terraform-aws"
 cidrblock = "10.0.0.0/16"
 instance_tenancy = "default"
 dns_support = "true"
 dns_hostnames = "true"
}
# file function not works here
#aws_public_key  = "${file("../aws_keys/aws-terraform.pub")}"

aws_pub_subnet = {
 cidrblock         = "10.0.1.0/24"
 map_public_ip     = "true"
 availability_zone = "us-east-1a"
 tag               = "tf-aws-pub-subnet"
}

aws_routetable = {
 cidrblock        = "0.0.0.0/0"
 tag              = "tf-aws-route-table"
}
