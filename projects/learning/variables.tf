# Input Variable
variable "instance_type" {
  type    = string
  default = "t3.micro"
}

variable "ami" {
  type    = string
  default = "ami-0150189e4c09ffab5"
}
# Above is an example of input variables in Terraform. 
# Input variables allow us to parameterize our Terraform configurations, making 
# them more flexible and reusable.

# https://developer.hashicorp.com/terraform/language/values/variables

# Local Variables
locals {
  instance_ami = "ami-0150189e4c09ffab5"
}

# Local variables are used to define values that are computed from other values in the configuration.
# They are useful for simplifying complex expressions and improving readability.
# Best for values that are to be used multiple times in the configuration. 

# Output Variable
output "instance_id" {
  description = "The ID of the created EC2 instance"
  value       = module.ec2.instance_id
}

# Output variables allow us to extract and display information about the resources created by Terraform.
# They are useful for providing information to users after Terraform applies the configuration,
# or for passing information to other Terraform configurations when using modules. Or even automation tools. 