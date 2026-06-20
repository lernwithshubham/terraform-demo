# Terraform Demo

A comprehensive Infrastructure as Code (IaC) project that demonstrates automated AWS EC2 instance provisioning using Terraform and Jenkins CI/CD pipeline.

## Repository Overview

This repository contains Terraform configuration files and a Jenkins pipeline to automate the deployment and management of AWS infrastructure. It's designed as an educational project to learn Infrastructure as Code automation best practices.

## Repository Contents

| File | Purpose |
|------|---------|
| **provider.tf** | Configures AWS as the cloud provider |
| **main.tf** | Defines the EC2 instance resource |
| **variables.tf** | Declares input variables with defaults |
| **outputs.tf** | Exports the EC2 instance's public IP |
| **jenkinsfile** | CI/CD pipeline for automated deployment |

## Code Flow Explanation

### Terraform Configuration Flow

```
provider.tf
    ↓
    └─→ Connects to AWS region (default: us-east-2)
    
variables.tf
    ↓
    └─→ Defines 3 input variables:
        • aws_region: AWS region (default: us-east-2)
        • instance_type: EC2 type (default: t2.micro)
        • ami_id: Machine image ID (default: ami-0c5ddb3560e768732)
    
main.tf
    ↓
    └─→ Creates AWS EC2 instance using:
        • AMI ID from variables
        • Instance type from variables
        • Tags the instance as "ExampleInstance"
    
outputs.tf
    ↓
    └─→ Exports the public IP of created instance
```

### Jenkins Pipeline Workflow

The Jenkinsfile automates the entire deployment process with the following stages:

```
Pipeline Execution:
    ↓
1️⃣ Checkout Stage
   └─→ Clones this repository from GitHub
       Command: git branch: 'main', url: 'https://github.com/lernwithshubham/terraform-demo.git'
    ↓
2️⃣ Terraform Init
   └─→ Downloads AWS provider plugins & initializes Terraform
       Command: terraform init
    ↓
3️⃣ Terraform Plan
   └─→ Generates execution plan (shows what will be created)
       Command: terraform plan
    ↓
4️⃣ Terraform Apply
   └─→ Provisions EC2 instance on AWS with auto-approval
       Command: terraform apply -auto-approve
    ↓
5️⃣ Terraform Destroy
   └─→ Cleans up (destroys) the infrastructure
       Command: terraform destroy -auto-approve
```

### Environment Configuration

The Jenkinsfile sets up the following environment variables:

```
• TF_VAR_aws_region = 'us-east-2'
• AWS_ACCESS_KEY_ID (from Jenkins credentials)
• AWS_SECRET_ACCESS_KEY (from Jenkins credentials)
```

## Variables Reference

### aws_region
- **Description**: AWS region to deploy infrastructure
- **Type**: string
- **Default**: us-east-2

### instance_type
- **Description**: Instance type for EC2
- **Type**: string
- **Default**: t2.micro

### ami_id
- **Description**: Amazon Machine Image for EC2
- **Type**: string
- **Default**: ami-0c5ddb3560e768732

## Outputs Reference

### instance_public_ip
- **Description**: The public IP of the created EC2 instance
- **Value**: aws_instance.example.public_ip

## Resource Created

This Terraform configuration creates:

- **AWS EC2 Instance**
  - AMI: Amazon Machine Image (configurable)
  - Instance Type: t2.micro (configurable)
  - Region: us-east-2 (configurable)
  - Tags: Name = "ExampleInstance"

## Getting Started

### Prerequisites

- Terraform installed
- AWS account with valid credentials
- Jenkins (optional, for CI/CD automation)

### Local Setup

1. Clone the repository:
   ```bash
   git clone https://github.com/lernwithshubham/terraform-demo.git
   cd terraform-demo
   ```

2. Initialize Terraform:
   ```bash
   terraform init
   ```

3. Review the plan:
   ```bash
   terraform plan
   ```

4. Apply the configuration:
   ```bash
   terraform apply
   ```

5. Retrieve the output:
   ```bash
   terraform output instance_public_ip
   ```

6. Clean up (when done):
   ```bash
   terraform destroy
   ```

## CI/CD Integration with Jenkins

The repository includes a Jenkinsfile for automated deployment. When triggered, Jenkins will:

1. Checkout the code
2. Initialize Terraform
3. Generate and review the plan
4. Automatically apply the configuration
5. Destroy the infrastructure (optional cleanup stage)

## Learning Objectives

This project demonstrates:

✅ Terraform basics and HCL syntax  
✅ Provider configuration and authentication  
✅ Resource creation and management  
✅ Input variables and outputs  
✅ CI/CD pipeline automation with Jenkins  
✅ Infrastructure provisioning best practices  
✅ Version control for infrastructure code  

## Project Structure

```
terraform-demo/
├── provider.tf          # AWS provider configuration
├── main.tf              # EC2 resource definition
├── variables.tf         # Input variables
├── outputs.tf           # Output values
├── jenkinsfile          # CI/CD pipeline definition
└── README.md            # This file
```

## License

This project is open source and available for educational purposes.

## Author

**lernwithshubham**

---

For more information about Terraform, visit: https://www.terraform.io/docs
