locals {
  ingress_rules = [{
    port = 22
    description = "ingress for port 22"
  },
  {
    port = 443
    description = "ingress for port 443"
  }

  ]
}

resource "aws_security_group" "SG" {
    name = "security group for automate"
    vpc_id = data.aws_vpc.main.id
    dynamic "ingress" {
        for_each = local.ingress_rules
      content {
        description = ingress.value.description
        from_port = ingress.value.port
        to_port = ingress.value.port
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]

      }
    }
    tags = {
        name = "Dev SG"
    }
  
}

## ------------------------------ with custom iterator name -------------------------------------------------------------------

dynamic "ingress" {
        for_each = local.ingress_rules
        iterator = "ports"
      content {
        description = ports.value.description
        from_port = ports.value.port
        to_port = ports.value.port
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]

      }
#-------------------------------------------------------------------------------------------------