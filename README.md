# Automated AWS Infrastructure Deployment (Terraform)

This repository contains a production-ready, modular AWS infrastructure built with Terraform. It implements a highly available, multi-tier architecture with a Blue-Green deployment strategy to ensure zero-downtime updates.

## 🚀 Features

* **Modular Architecture:** Separate modules for VPC, Networking (ALB), and Compute (ASG) for maximum reusability.
* **Multi-Tier Networking:** Public subnets for external Load Balancers and private subnets for application security.
* **High Availability:** Infrastructure distributed across multiple Availability Zones (AZs).
* **Blue-Green Deployment:** Engineered to switch traffic between environments, reducing deployment downtime by up to 95%.
* **Auto-Scaling:** Automatic scaling of EC2 instances based on traffic demand.

## 🏗 Architecture Diagram



## 📁 Project Structure

```text
aws-terraform-infrastructure/
├── modules/
│   ├── vpc/            # VPC, Subnets, Internet Gateway, NAT
│   ├── compute/        # Auto Scaling Group, Launch Templates
│   └── networking/     # Load Balancer, Target Groups, Security Groups
├── environments/
│   └── prod/           # Production-specific configuration (Root Module)
├── scripts/            # Automation scripts for deployment logic
└── README.md
```

## 🛠 Prerequisites
	
* 	**Terraform** (v1.0+)

* 	**AWS CLI** configured with appropriate IAM permissions

* 	An AWS Account

## 🚦 Getting Started

* *1. Clone the repository:*

```text
git clone [https://github.com/mpawar006/aws-terraform-infrastructure.git](https://github.com/mpawar006/aws-terraform-infrastructure.git)
cd aws-terraform-infrastructure/environments/prod
```
* *2. Initialize Terraform:*
```text
terraform init
```
* *3. Plan the deployment:*
```text
terraform plan
```
* *4. Apply the configuration:*
```text
terraform apply
```
## 🛡 Security & Best Practices

*	*. Least Privilege:* Security groups are restricted to only necessary ports (e.g., HTTP 80 for ALB).
*	*. State Management:* (Optional) Configure an S3 backend for remote state locking and team collaboration.
*	*. Data Isolation:* Application instances reside in private subnets with no direct internet access.

*Maintained by* Mahesh Pawar Cloud Architect
