variable "access_key" {
 default = "<PUT IN YOUR AWS ACCESS KEY>"
}
variable "secret_key" {
        default = "<PUT IN YOUR AWS SECRET KEY>"
}
variable "region" {
        default = "us-east-1"
}
variable "availabilityZone" {
        default = "us-east-1a"
}
variable "instanceType" {
        default = "t2.micro"
}
variable "keyName" {
        default = "<PUT IN THE NAME OF YOUR AWS PEM KEY>"
}
variable "subnet" {
        default = "subnet-<PUT IN YOUR VPC SUBNET>"
}
variable "securityGroups" {
        type = list
        default = [ "sg-<PUT IN YOUR VPC SECURITY GROUP>" ]
}
variable "instanceName" {
       default = "<PUT IN YOUR INSTANCE NAME>"
}
variable "amis" {
    default = {
        "us-east-1" = "ami-0b898040803850657"
    }
}
# end of variables.tf
