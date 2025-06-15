resource "aws_instance" "private_ec2_instance" {
  ami                    = var.image_id
  instance_type          = var.private_instance_type
  subnet_id              = var.subnet_id
  vpc_security_group_ids = [var.ec2_security_group_id]
  key_name               = var.key_name
  associate_public_ip_address = false
  
  tags = {
    Name = var.private_instance_name
  }
}