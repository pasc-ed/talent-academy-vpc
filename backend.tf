# BACKEND CONFIGURATION
terraform {
  backend "s3" {
    bucket = "talent-academy-439272626435-tfstates-pascal"
    key    = "sprint2/basic-vpc/terraform.tfstates"
    dynamodb_table = "terraform-lock"
  }
}