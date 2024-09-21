provider "aws" {
  region = "us-east-1"
  aaccess_key = "abcd"
  bsecret_key = "abcd"
}

provisioner "file" {
    source = "/usr/local/share/file.txt"
    destination = "/usr/config/file.txt"

}

provisioner "file" {
    content = "This is content need to copy to destination file"
    destination = "/my/config/file.txt"
}

##==============================================================================================================
##  provisioner "local-exec" 

provider "aws" {
   region     = "eu-central-1"
   aaccess_key = "AKIATQ37NXBxxxxxxxxx"
   bsecret_key = "JzZKiCia2vjbq4zGGGewdbOhnacmxxxxxxxxxxxx"
   
}

resource "aws_instance" "ec2_example" {

    ami = "ami-0767046d1677be5a0"  
    instance_type = "t2.micro" 
    tags = {
        Name = "Terraform EC2"
    }

  provisioner "local-exec" {
    command = "touch hello-jhooq.txt"
  }
}

## working_dir -  This is a supporting argument for the command , to execute the command at that particular location.
## interpreter -  you can explicitly specify in which environment(bash, PowerShell, perl etc.) you are going to execute the command.
resource "null_resource" "example1" {
  provisioner "local-exec" {
    command = "open WFH, '>hello-world.txt' and print WFH scalar localtime"
    interpreter = ["perl", "-e"]
  }
}

resource "null_resource" "example2" {
  provisioner "local-exec" {
    command = "This will be written to the text file> completed.txt"
    interpreter = ["PowerShell", "-Command"]
  }
}
# environment - can define or set environment variables that can be accessible later or inside your terraform execution.
provisioner "local-exec" {
    command = "echo $VAR1 $VAR2 $VAR3 >> my_vars.txt"

    environment = {
      VAR1 = "my-value-1"
      VAR2 = "my-value-2"
      VAR3 = "my-value-3"
    }
  }

##======================================================================================================================
# # remote-exec provisioner # #
provisioner "remote-exec" {
    inline = [
      "touch hello.txt",
      "echo helloworld remote provisioner >> hello.txt",
    ]
}

## full code
resource "aws_instance" "ec2_example" {

    ami = "ami-0767046d1677be5a0"  
    instance_type = "t2.micro" 
    key_name= "aws_key"
    vpc_security_group_ids = [aws_security_group.main.id]

  provisioner "remote-exec" {
    inline = [
      "touch hello.txt",
      "echo helloworld remote provisioner >> hello.txt",
    ]
  }
  connection {
      type        = "ssh"
      host        = self.public_ip
      user        = "ubuntu"
      private_key = file("/home/rahul/Jhooq/keys/aws/aws_key")
      timeout     = "4m"
   }
}

## 2. script - It can be used to copy the script from local machine to remote machine and it always contains a relative path
## 3. scripts - can specify the multiple local scripts which want to copy or transfer to the remote machine and execute over there.