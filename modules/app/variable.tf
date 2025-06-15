variable "subnet_id" {
  type = string
}

variable "ec2_security_group_id" {
  type = string
}

# 

variable "key_name" {
  type = string
  description = "name of the keypair to use for the instance"
  nullable = false
}

variable "image_id" {
  type        = string
  description = "The id of the machine image (AMI) to use for the server."
}

# 

variable "private_instance_type" {
  type = string
  default = "t2.micro"
}

variable "private_instance_name" {
  type = string
  default = "private_ec2_demo_instance"
}