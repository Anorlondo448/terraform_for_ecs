###
#
# Container Resource
#
module "container" {
  source = "../../module/container"

  service-name = "${var.service-name}"
  env-short    = "${var.env-short}"
}
