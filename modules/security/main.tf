
# App SG (Django / FastAPI / Next.js)
resource "aws_security_group" "app_sg" {
  name        = "app_sg"
  description = "[${var.app_name}] Allow traffic from ALB and Bastion"
  vpc_id      = var.vpc_id  

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = var.tags
}
