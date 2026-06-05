resource "aws_instance" "this" {
  ami                     = "ami-0150189e4c09ffab5"
  instance_type           = "t3.micro"
  availability_zone       = "eu-west-2a"
  # Add in other configuration options as needed
  # Some may be required, such as tags, key_name, etc.
  # Other options may be optional, such as user_data, monitoring, etc.
}