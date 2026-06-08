

resource "aws_instance" "web" {

  ami           = var.ami
  instance_type = var.instance_type

  key_name = var.key_pair_name

  vpc_security_group_ids = [
    aws_security_group.web.id
  ]

  user_data = file("${path.module}/cloud-init/nginx.yaml") # Read user data from file and injects it into the EC2 instance

  tags = {
    Name = "CloudInit-WebServer"
  }
}

###

resource "aws_security_group" "web" {

  name = "web-sg"

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    description = "Allow HTTP traffic from anywhere"
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = var.allowed_ip
    description = "Allow SSH traffic from specific IP"
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
    description = "Allow all outbound traffic"
  }
}