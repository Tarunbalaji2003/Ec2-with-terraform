# Terraform AWS EC2 Multi-Region Deployment

This repository contains Terraform code to deploy two EC2 instances into two different AWS regions (`us-east-1` and `us-east-2`) using the same Terraform code. The infrastructure includes VPC, subnets, and other necessary components.

## Prerequisites

Before you begin, ensure you have the following installed on your local machine:

- [Terraform](https://www.terraform.io/downloads.html) (version 1.0 or later)
- [AWS CLI](https://aws.amazon.com/cli/) (version 2.0 or later)
- AWS account with the necessary permissions to create resources

## Setup Instructions

### 1. Clone the Repository

Clone this repository to your local machine using the following command:

```sh
git clone https://github.com/yourusername/terraform-aws-ec2-multi-region.git
cd terraform-aws-ec2-multi-region
```
### 2. Configure AWS Credentials

Ensure your AWS CLI is configured with the necessary credentials. You can configure it by running

```sh
aws configure
```
### 3. Initialize Terraform
Initialize the Terraform configuration to download the necessary providers and set up the backend:

```sh

terraform init

```
This command initializes the working directory containing Terraform configuration files. It downloads the provider plugins required for the configuration.

### 4. Plan the Infrastructure
Run the Terraform plan command to see the changes that will be made by the configuration:

```sh

terraform plan
```
This command creates an execution plan, showing what actions Terraform will take to achieve the desired state defined in the configuration files.

### 5. Apply the Configuration
Apply the Terraform configuration to create the resources. This step will prompt you to confirm before applying the changes:

```
terraform apply -auto-approve
```

This command applies the changes required to reach the desired state of the configuration, as defined by the plan.

### 6. Verify the Deployment
Once the apply process is complete, Terraform will output the results, including the IDs of the created EC2 instances. You should see output similar to this:

```
Apply complete! Resources: 4 added, 0 changed, 0 destroyed.

Outputs:

us_east_1_instance_id = "i-0abcd1234efgh5678"
us_east_2_instance_id = "i-0abcd1234efgh5679"
```

This output indicates that the EC2 instances have been successfully created in both regions with their respective IDs.

### Project Structure
The repository contains the following files and directories:

 - main.tf: The main Terraform configuration file.
 - outputs.tf : Output of the main Terraform configuration file.
 - variables.tf : Variable definitions for the main Terraform configuration file.
 - modules/network/: A directory containing the network module, which sets up the VPC, subnets, and related resources.
     - main.tf: Resources for VPC, subnets, and other network components.
     - variables.tf: Variable definitions for the network module.
     - versions.tf: Specifies the required providers for the network module.
    - outputs.tf: Outputs for the network module.
     - Variables

The following variables are used in the Terraform configuration:

 - Main Configuration (main.tf)
  - region: The AWS region for the deployment (default: us-east-1).
- Network Module (modules/network/variables.tf)
- name: The name of the VPC and related resources.
- vpc_cidr: The CIDR block for the VPC.
- subnet_cidrs: The CIDR blocks for the subnets.
- availability_zones: The availability zones for the subnets.


### Clean Up
To destroy the resources created by this Terraform configuration, run the following command:
``` sh

terraform destroy -auto-approve
``` 
This command destroys all resources managed by the current Terraform configuration.
### Acknowledgements
[Terraform](https://www.terraform.io/)
[AWS](https://aws.amazon.com/)
[Ubuntu](https://ubuntu.com/)


This `README.md` file provides detailed explanations for each step, ensuring users can easily set up and run the Terraform configuration to deploy EC2 instances in multiple regions.


