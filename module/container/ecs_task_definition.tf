###
#
# ECS Task Definition
#
resource "aws_ecs_task_definition" "sample" {
  family                   = "${var.service-name}-${var.env-short}"
  container_definitions    = "${data.template_file.container-definition.rendered}"
  cpu                      = "256"
  memory                   = "512"
  network_mode             = "awsvpc"
  requires_compatibilities = ["FARGATE"]
  execution_role_arn       = "${aws_iam_role.ecs-task-execution.arn}"
  task_role_arn            = "${aws_iam_role.ecs-task.arn}"
}

data "template_file" "container-definition" {
  template = "${file("${path.module}/template/container-definition.json")}"

  vars {
    account-id   = "${var.account-id}"
    service-name = "${var.service-name}"
    env-short    = "${var.env-short}"
    aws-region   = "${var.aws-region}"
  }
}
