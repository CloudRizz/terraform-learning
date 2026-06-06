# import {
#   to = aws_instance.import
#   id = "i-0268a5cfa7b8fa596"
# }

# This file is used to import existing resources into Terraform state.
# The `import` block specifies the resource to import and its ID.
# In this example, we are importing an AWS EC2 instance with the 
# ID "i-0268a5cfa7b8fa596" into the `aws_instance.import` resource defined in `ec2.tf`.
# We must ensure a resource block for `aws_instance.import` exists in `ec2.tf` with the 
# same configuration as the existing resource for the import to work correctly.
# Just uncomment the block and run `terraform import` to execute the import process.