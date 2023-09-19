# Terraform AWS Infrastructure Deployment

This Terraform project deploys a basic AWS infrastructure including a Virtual Private Cloud (VPC), a subnet, an internet gateway, route tables, a security group, and EC2 instances. This README provides an overview of the infrastructure and instructions on how to deploy it using Terraform.

## Table of Contents
- [Terraform AWS Infrastructure Deployment](#terraform-aws-infrastructure-deployment)
  - [Table of Contents](#table-of-contents)
  - [Prerequisites](#prerequisites)
  - [Getting Started](#getting-started)
  - [Terraform Configuration](#terraform-configuration)
    - [VPC](#vpc)
    - [Subnet](#subnet)
    - [Internet Gateway](#internet-gateway)
    - [Routes](#routes)
    - [Security Group](#security-group)
    - [EC2 Instances](#ec2-instances)
  - [Terraform Variables](#terraform-variables)
  - [Deploy the Infrastructure](#deploy-the-infrastructure)
  - [Destroy the Infrastructure](#destroy-the-infrastructure)
  - [Variables](#variables)
  - [Outputs](#outputs)
  - [Makefile](#makefile)
    - [Copy environment variables for Makefile](#copy-environment-variables-for-makefile)
    - [Deploy the Infrastructure - Makefile](#deploy-the-infrastructure---makefile)
    - [Destroy the Infrastructure - Makefile](#destroy-the-infrastructure---makefile)

## Prerequisites
Before you begin, ensure you have the following prerequisites in place:
- [Terraform](https://www.terraform.io/downloads.html) installed on your local machine.
- AWS access and secret access keys with necessary permissions configured. You can set these as environment variables or in a credentials file.
- [Ansible](https://docs.ansible.com/ansible/latest/installation_guide/intro_installation.html) installed on your local machine.

## Getting Started
1. Clone this repository to your local machine.
```sh
git clone https://github.com/ktechhub/terraform-ansible.git
```

2. Navigate to the project directory:
```sh
cd terraform-ansible
```

## Terraform Configuration
The Terraform configuration is provided in the `main.tf` file. Here's an overview of the resources created:

### VPC
- Creates an AWS VPC with a specified CIDR block.

### Subnet
- Defines a subnet within the VPC with a specific CIDR block and availability zone.

### Internet Gateway
- Establishes an internet gateway and attaches it to the VPC.

### Routes
- Sets up a public route table and associates it with the subnet.
- Creates a route for internet-bound traffic via the internet gateway.

### Security Group
- Defines a security group allowing inbound SSH and HTTP traffic.

### EC2 Instances
- Launches EC2 instances using specified parameters, including the subnet and security group.

## Terraform Variables
Copy the variables with:
```sh
cp terraform.tfvars.example terraform.tfvars
```
Update the variables with the right values.


## Deploy the Infrastructure
1. Initialize Terraform in the project directory:
   ```sh
   terraform init
   ```

2. Create an execution plan to preview the changes:
   ```sh
   terraform plan
   ```

3. Apply the changes to create the infrastructure:
   ```sh
   terraform apply
   ```

4. Confirm by typing `yes` when prompted.

5. Terraform will provision the infrastructure. Wait for it to complete.

## Destroy the Infrastructure
To destroy the infrastructure and release AWS resources:

1. Navigate to the project directory.

2. Run:
   ```sh
   terraform destroy
   ```

3. Confirm by typing `yes` when prompted.

## Variables
You can customize the infrastructure by modifying the variables defined in the `variables.tf` file. Here are the available variables:

- `access_key`: AWS Access Key
- `secret_key`: AWS Secret Access Key
- `workspace`: Environment (default: "dev")
- `vpc_cidr_block`: CIDR block for the VPC (default: "10.0.0.0/16")
- `ami`: Amazon Machine Image (AMI) ID (default: "ami-0af9d24bd5539d7af")
- `instance_type`: EC2 instance type (default: "t2.micro")
- `key_pair_name`: Name of the key pair (default: "mumuni")
- `instance_count`: Number of EC2 instances to launch (default: 1)

## Outputs
After applying the Terraform configuration, you can retrieve information about the created resources using Terraform outputs:

- `vpc_id`: ID of the VPC.
- `subnet_id`: ID of the subnet.
- `ig_id`: ID of the internet gateway.
- `instances`: List of EC2 instance private and public IP addresses.



## Makefile
The Makefile provides convenient targets for running Terraform and Ansible commands. You can execute these targets as follows:

- `make tf-init`: Initialize Terraform.
- `make tf-plan`: Create an execution plan for Terraform.
- `make tf-apply`: Apply Terraform changes.
- `make tf-destroy`: Destroy the Terraform infrastructure.
- `make ansible-apply`: Apply the Ansible playbook located in the `ansible` directory.

### Copy environment variables for Makefile
The makefile can use both a `.env` or `.tfvars` file to pass the variables. In this illustration, we will focus on the `.env`. Copy the example file and update the values of the variables
```sh
cp .env.example .env
```

### Deploy the Infrastructure - Makefile
1. Initialize Terraform in the project directory:
   ```sh
   make tf-init
   ```

2. Create an execution plan to preview the changes:
   ```sh
   make tf-plan
   ```

3. Apply the changes to create the infrastructure:
   ```sh
   make tf-apply
   ```

4. Confirm by typing `yes` when prompted.

5. Terraform will provision the infrastructure. Wait for it to complete.

### Destroy the Infrastructure - Makefile
To destroy the infrastructure and release AWS resources:

1. Navigate to the project directory.

2. Run:
   ```sh
   make tf-destroy
   ```

3. Confirm by typing `yes` when prompted.