resource "aws_instance" "web" {
  ami           = "ami-03265a0778a880afb"
  instance_type = "t2.micro"
  vpc_security_group_ids = [aws_security_group.roboshop-all.id]

  tags = {
    Name = "HelloWorld"
  }
}

resource "aws_security_group" "roboshop-all" {
  name        = var.sg-name
  description = var.sg-description
  # vpc_id      = aws_vpc.main.id

  ingress {
    description = "Allow all Ports"
    from_port   = var.inbound-from-port
    to_port     = 0
    protocol    = "tcp"
    cidr_blocks = var.cidr_blocks
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "roboshop-all-aws"
  }

}