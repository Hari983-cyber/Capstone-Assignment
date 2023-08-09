module "vpc" {
  source = "terraform-aws-modules/vpc/aws"

  name = "Capstone_VPC"
  cidr = "10.0.0.0/16"

  azs             = ["us-east-1a", "us-east-1b"]
  private_subnets = ["10.0.1.0/24", "10.0.2.0/24"]
  public_subnets  = ["10.0.101.0/24", "10.0.102.0/24"]

  enable_nat_gateway = true
  enable_vpn_gateway = false

  tags = {
    Terraform = "true"
    Environment = "dev"
    Company = "upGrad"
  }
}
module "capstone_service_sg" {
  source = "terraform-aws-modules/security-group/aws"

  name        = "Capstone_SG"
  description = "Security group for port ssh open to everyone"
  vpc_id      = module.vpc.vpc_id

  ingress_with_cidr_blocks = [
    {
      from_port   = 22
      to_port     = 22
      protocol    = "tcp"
      description = "User-service ports"
      cidr_blocks = "0.0.0.0/0"
    }
]
 egress_rules = [
 "all-all"]
}
