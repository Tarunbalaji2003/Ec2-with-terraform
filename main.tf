terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 3.0"
    }
  }
}

provider "aws" {
  alias  = "us_east_1"
  region = "us-east-1"
}

provider "aws" {
  alias  = "us_east_2"
  region = "us-east-2"
}

module "network_us_east_1" {
  source             = "./modules/network"
  providers          = { aws = aws.us_east_1 }
  region             = "us-east-1"
  name               = "us-east-1"
  vpc_cidr           = "10.0.0.0/16"
  subnet_cidrs       = ["10.0.1.0/24", "10.0.2.0/24"]
  availability_zones = ["us-east-1a", "us-east-1b"]
}

module "network_us_east_2" {
  source             = "./modules/network"
  providers          = { aws = aws.us_east_2 }
  region             = "us-east-2"
  name               = "us-east-2"
  vpc_cidr           = "10.1.0.0/16"
  subnet_cidrs       = ["10.1.1.0/24", "10.1.2.0/24"]
  availability_zones = ["us-east-2a", "us-east-2b"]
}

resource "aws_instance" "us_east_1" {
  provider       = aws.us_east_1
  ami            = "ami-0e001c9271cf7f3b9"  # Ubuntu 20.04 LTS AMI for us-east-1
  instance_type  = "t2.small"
  subnet_id      = element(module.network_us_east_1.subnet_ids, 0)
  tags = {
    Name = "us-east-1-instance"
  }
}

resource "aws_instance" "us_east_2" {
  provider       = aws.us_east_2
  ami            = "ami-09040d770ffe2224f"  # Ubuntu 20.04 LTS AMI for us-east-2
  instance_type  = "t2.small"
  subnet_id      = element(module.network_us_east_2.subnet_ids, 0)
  tags = {
    Name = "us-east-2-instance"
  }
}
