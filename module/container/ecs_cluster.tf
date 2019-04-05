###
#
# ECS Cluster
#
resource "aws_ecs_cluster" "sample" {
  name = "${var.service-name}-${var.env-short}"
}