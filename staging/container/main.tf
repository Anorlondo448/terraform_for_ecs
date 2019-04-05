###
#
# Container Resource
#
module "container" {
  source = "../../module/container"

  service-name = "${var.service-name}"
  env-short    = "${var.env-short}"
  account-id   = "${data.aws_caller_identity.current.account_id}"
  aws-region   = "${data.aws_region.current.name}"
}
