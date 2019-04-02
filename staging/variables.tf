###
#
# Variables
#
data "aws_caller_identity" "current" {}

data "aws_region" "current" {}

variables "service-name" {
  default = "tfe"
}

variables "environment" {
  default = "staging"
}
