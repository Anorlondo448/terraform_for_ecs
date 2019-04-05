###
#
# CodePipeline
#
resource "aws_codepipline" "sample" {
  name = "${var.service-name}-${var.environment}"
}
