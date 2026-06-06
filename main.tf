module "ec2" {
    source = "./modules/ec2"
}

# This is the main Terraform configuration file that defines the resources and modules to be created.
# In this example, we are using a module called "ec2" that is located in the "modules/ec2" directory.
# The `source` attribute specifies the path to the module, which contains the configuration for creating an EC2 instance.
# By using modules, we can organize our Terraform code into reusable components, making it easier to manage and maintain our infrastructure.
