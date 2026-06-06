resource "aws_instance" "this" {
  ami                     = var.ami # Variable reference to the AMI ID defined in variables.tf
  instance_type           = var.instance_type # Variable reference to the instance type defined in variables.tf

  # Add in other configuration options as needed
  # Some may be required, such as tags, key_name, etc.
  # Other options may be optional, such as user_data, monitoring, etc.
}

# resource "aws_instance" "import" {
#   ami                     = local.instance_ami
#   instance_type           = var.instance_type
#   availability_zone       = "eu-west-2a"

#   tags = {
#     Name = "terraform-instance"
#   }