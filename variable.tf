variable "region" {
  type    = string
  default = "ap-southeast-1"
}

variable "vpc_name" {
  type = string
}

variable "cidr_block" {
  type = string
}

variable "availability_zones" {
  type = list(string)
}

variable "public_subnet_ips" {
  type = list(string)
}

variable "private_subnet_ips" {
  type = list(string)
}

# 

variable "key_pair_path" {
  type = string
  default = "./keypair/ec2_demo_key.pub"
  description = "Path to the keypair to use"
}

variable "key_pair_name" {
  type = string
  default = "ec2_demo_key_pair"
  description = "Name of the keypair to use"
}

variable "instance_type" {
  type = string
  default = "t2.micro"
  description = "Type of EC2 instance to create"
}

variable "instance_name" {
  type = string
  default = "ec2_demo_instance"
  description = "Name of the EC2 instance to create"
}

variable "amis" {
  type = map(string)
  default = {
    "ap-southeast-1" = "ami-02c7683e4ca3ebf58"
    "ap-northeast-1" = "ami-054400ced365b82a0"
  }
  description = "Map of AMIs to use for each region"
}


# 

variable "public_sg_name" {
  type = string
  default = "public_security_group"
}

variable "public_sg_description" {
  type = string
  default = "public_security_group_dec"
}

variable "private_sg_name" {
  type = string
  default = "private_security_group"
}

variable "private_sg_description" {
  type = string
  default = "private_security_group_dec"
}

# 

variable "app_name" {
  type = string
}

variable "environment" {
  type = string
}

variable "private_instance_type" {
  type = string
  default = "t2.micro"
}

variable "private_instance_name" {
  type = string
  default = "private_ec2_demo_instance"
}

variable "enable_nat_gateway" {
  type    = bool
  default = false
}
