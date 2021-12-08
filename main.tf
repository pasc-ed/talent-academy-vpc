module "network" {
  source = "github.com/pasc-ed/talent-academy-vpc-module"

  vpc_cidr         = var.vpc_cidr
  region           = var.region
  vpc_name         = var.vpc_name
  internet_gw_name = var.internet_gw_name
  public_a_cidr    = var.public_a_cidr
  public_b_cidr    = var.public_b_cidr
  public_c_cidr    = var.public_c_cidr
  private_a_cidr   = var.private_a_cidr
}