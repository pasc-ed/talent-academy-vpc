# BACKEND CONFIGURATION
terraform {
  backend "s3" {
    bucket         = "talent-academy-439272626435-tfstates-pascal"
    key            = "sprint3/vpc-module/terraform.tfstates"
    dynamodb_table = "terraform-lock"
  }
}