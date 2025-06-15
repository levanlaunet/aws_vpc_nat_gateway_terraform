terraform {
  required_version = ">= 1.5.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.40"
    }
  }
}

provider "aws" {
  region = var.region
}

resource "aws_key_pair" "ec2_demo_key_pair" {
  key_name   = var.key_pair_name
  public_key = file(var.key_pair_path)
}

module "networking" {
  source             = "./modules/networking"
  vpc_name           = var.vpc_name
  cidr_block         = var.cidr_block
  availability_zones = var.availability_zones
  public_subnet_ips  = var.public_subnet_ips
  private_subnet_ips = var.private_subnet_ips
  environment = var.environment
  enable_nat_gateway = var.enable_nat_gateway
}

module "security" {
  source = "./modules/security"
  vpc_id = module.networking.vpc_id
  public_sg_name = var.public_sg_name
  public_sg_description = var.public_sg_description
  private_sg_name = var.private_sg_name
  private_sg_description = var.private_sg_description
  app_name = var.app_name
}

module "app" {
  source = "./modules/app"
  subnet_id = module.networking.public_subnet_ids[0]
  ec2_security_group_id = module.security.app_sg_id
  key_name = aws_key_pair.ec2_demo_key_pair.key_name
  private_instance_type = var.private_instance_type
  private_instance_name = var.private_instance_name
  image_id = var.amis[var.region]
}