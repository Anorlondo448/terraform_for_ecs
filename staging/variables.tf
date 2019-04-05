###
#
# Variables
#
data "aws_caller_identity" "current" {}

data "aws_region" "current" {}

variable "service-name" {
  default = "sample"
}

variable "env-short" {
  default = "stg"
}
