variable "aws_region" {
  type    = string
  default = "eu-west-2"
}

variable "ami" {
  type    = string
  default = "ami-0d114020bf27f27cf"
}

variable "instance_type" {
  type    = string
  default = "t2.micro"
}

variable "key_pair_name" {
  type    = string
  default = "ec2-user"
}

variable "allowed_ip" {
  type    = list(string)
}

