# EC2 instance for WordPress

resource "aws_instance" "wordpress" {
  ami                         = var.instance_ami
  instance_type               = var.instance_type
  key_name                    = var.key_name
  vpc_security_group_ids     = [aws_security_group.wordpress_sg.id]

 user_data = templatefile("${path.module}/user-data.sh", {
  db_name     = aws_db_instance.wordpress.db_name
  db_user     = aws_db_instance.wordpress.username
  db_password = var.db_password
  db_host     = aws_db_instance.wordpress.endpoint
})
  user_data_replace_on_change = true

  tags = {
    Name = "Terraform-WordPress"
  }
}


# Security group for WordPress instance

resource "aws_security_group" "wordpress_sg" {
  name        = "wordpress-sg"
  description = "Allow HTTP and SSH"

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = var.allowed_ssh_cidr
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

## RDS instance for WordPress

resource "aws_db_instance" "wordpress" {
  allocated_storage    = 20
  engine              = "mysql"
  engine_version      = "8.0"
  instance_class      = "db.t3.micro"

  db_name  = var.db_name
  username = var.db_user
  password = var.db_password

  skip_final_snapshot = true
  publicly_accessible = false
  vpc_security_group_ids = [aws_security_group.rds_sg.id]
}

# RDS security group
resource "aws_security_group" "rds_sg" {
  name = "wordpress-rds-sg"

  ingress {
    from_port   = 3306
    to_port     = 3306
    protocol    = "tcp"
    security_groups = [aws_security_group.wordpress_sg.id]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}