variable "ec2_sg_name" {}
variable "vpc_id" {}

output "sg_ec2_sg_ssh" {
  value = aws_security_group.ec2_sg_ssh_http.id
}

resource "aws_security_group" "ec2_sg_ssh" {
  name        = var.ec2_sg_name
  description = "Enable the Port 22(SSH))"
  vpc_id      = var.vpc_id

  ingress {
    description = "Allow remote SSH from anywhere"
    cidr_blocks = ["0.0.0.0/0"]
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
  }

  egress {
    description = "Allow outgoing request"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "Security Groups to allow SSH(22)"
  }
}

}
