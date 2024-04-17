module "vpc_primary" {
  source             = "./modules/vpc"
  name               = var.nombre
  cidr               = var.cidr_primary
  availability_zones = var.availability_zones_primary
  public_subnets     = var.public_subnets_primary
  private_subnets    = var.private_subnets_primary
  database_subnets   = var.database_subnets_primary
  nat_ip_ids         = var.nat_ip_ids_primary
  environment        = var.environment
  suffix             = "p"

  tags = {
    "environment" : var.environment
  }
}






module "vpc" {
  source = "terraform-aws-modules/vpc/aws"

  name = "my-vpc"
  cidr = "10.0.0.0/16"

  azs             = ["us-east-1a", "us-east-1b", "us-east-1c"]
  private_subnets = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
  public_subnets  = ["10.0.101.0/24", "10.0.102.0/24", "10.0.103.0/24"]

  enable_nat_gateway = true
  enable_vpn_gateway = true

  tags = {
    Terraform = "true"
    Environment = "dev"
  }
}