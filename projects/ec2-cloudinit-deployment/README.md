# EC2 Deployment with Cloud-Init & Terraform

## Overview

This project demonstrates how to use **Terraform** and **cloud-init** together to automate the deployment and configuration of an AWS EC2 instance.

The goal is to provision a virtual server and automatically configure it on first boot to serve a web page using **NGINX**, with no manual setup required.

---

## Architecture

The solution follows a simple automation flow:

```
Terraform → AWS EC2 Instance → cloud-init → Ubuntu OS → NGINX → Web Server
```

* Terraform provisions the infrastructure (EC2, security groups, key pair access)
* cloud-init configures the instance on first boot
* NGINX is installed and started automatically
* A simple HTML page is served over HTTP

---

## Key Features

* Automated EC2 provisioning using Terraform
* Secure SSH access via key pair
* Restricted inbound SSH access (IP-based security)
* HTTP access enabled for web traffic
* Fully automated server configuration using cloud-init
* No manual server setup required after deployment

---

## Terraform Structure

The project is organised into a simple and reusable structure:

* `main.tf` → EC2 instance and security group configuration
* `variables.tf` → Input variables (AMI, instance type, key pair, IP restrictions)
* `outputs.tf` → Outputs such as public IP
* `cloud-init/nginx.yaml` → Boot-time configuration script

---

## cloud-init Configuration

The cloud-init file is used to automate server setup at launch.

It performs the following actions:

* Updates system packages
* Installs NGINX
* Enables and starts the NGINX service
* Writes a custom HTML homepage

This ensures the instance is fully configured immediately after boot.

---

## How user_data Works in Terraform

Terraform passes the cloud-init file into EC2 using the `user_data` field:

```
user_data = file("${path.module}/cloud-init/nginx.yaml")
```

This data is injected into the instance at launch, where **cloud-init reads and executes it automatically during the first boot cycle**.

---

## Deployment Steps

1. Initialise Terraform:

   ```
   terraform init
   ```

2. Review the execution plan:

   ```
   terraform plan
   ```

3. Deploy infrastructure:

   ```
   terraform apply
   ```

4. Access the application:

   ```
   http://<EC2_PUBLIC_IP>
   ```

---

## Challenges Faced

### 1. cloud-init Execution Issues

Initially, the cloud-init script did not execute correctly due to formatting and parsing issues. Logs indicated that the user-data was not being interpreted as a valid cloud-config file.

**Fix:**
Ensured the file began with `#cloud-config` and validated correct YAML formatting.

---

### 2. NGINX Not Installed on First Boot

The instance initially returned connection errors because NGINX was not installed, despite cloud-init completing.

**Fix:**
Revised cloud-init configuration to properly handle package installation and ensured system updates were included before installing NGINX.

---

### 3. Delayed Service Availability

Even after successful deployment, the application took time to become accessible due to cloud-init execution time and service startup delays.

**Fix:**
Understood that first-boot provisioning can take several minutes and is expected behaviour in cloud-based environments.

---

### 4. Security Group Configuration

Early testing included incorrect or conflicting security group settings, which caused access issues.

**Fix:**
Standardised on `vpc_security_group_ids` and restricted SSH access to a known IP address.

---

## Key Learnings

* Terraform is responsible for infrastructure provisioning, not configuration management
* cloud-init runs at first boot and is essential for automated server setup
* Debugging EC2 instances requires checking both system logs and cloud-init logs
* Separation of concerns improves reliability and maintainability
* First boot delays are normal in cloud environments

---

## Outcome

The final solution successfully deploys an EC2 instance that:

* Boots automatically via Terraform
* Installs and configures NGINX using cloud-init
* Serves a custom web page over HTTP
* Requires zero manual configuration after deployment

---

## Future Improvements

* Convert configuration into reusable Terraform modules
* Add dynamic AMI configuration
* Add Application Load Balancer (ALB) for scalability
* Implement auto-scaling groups for high availability
* Replace SSH access with AWS Systems Manager (SSM)
* Add CI/CD pipeline for automated deployments
