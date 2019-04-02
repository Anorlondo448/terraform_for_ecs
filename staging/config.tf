###
#
# Config
#
terraform {
  backend "s3" {
    bucket = "anorlondo448-terraform-for-ecs"
    key    = "staginc/terraform.tfstate"
    region = "us-east-1"
  }

  require_version = ">= 0.11.13"
}
