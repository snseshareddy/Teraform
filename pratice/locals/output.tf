output "public_ip" {
    value = aws_instance.ec2_server.public_ip
    sensitive = true       ## if dont want show value on console.
  
}