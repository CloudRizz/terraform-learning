variable "aws_region" {
  default = "eu-west-2"
}

variable "instance_type" {
  type    = string
  default = "t3.micro"
  description = "EC2 instance type for WordPress"
}

variable "instance_ami" {
  type    = string
  default = "ami-0150189e4c09ffab5"
  description = "AMI ID for the EC2 instance"
}

variable "key_name" {
  type    = string
  description = "Your AWS EC2 key pair name"
}

variable "allowed_ssh_cidr" {
  type    = list(string)
   description = "CIDR block allowed to access SSH - MY IP ONLY (22)"
}