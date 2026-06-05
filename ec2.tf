resource "aws_instance" "this" {
  ami                     = "ami-00e801948462f718a"
  instance_type           = "t3.micro"
  availability_zone       = "eu-west-2"
  # Add in other configuration options as needed
  # Some may be required, such as tags, key_name, etc.
  # Other options may be optional, such as user_data, monitoring, etc.
}