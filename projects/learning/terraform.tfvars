instance_type = "t3.micro"

# This is best practice to avoid hardcoding values in the configuration files. 
# By defining variables, we can easily change the values without modifying the code. 
# In this case, we have defined a variable for the instance type and ami-id, which allows us to 
# specify the desired instance type when running Terraform commands or by providing a default value.