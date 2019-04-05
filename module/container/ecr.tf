###
#
# ECR
#
resource "aws_ecr_repository" "sample" {
  name = "${var.service-name}"
}