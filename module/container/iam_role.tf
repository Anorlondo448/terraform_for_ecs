###
#
# IAM Role
#
# ECS Task Role
data "aws_iam_policy_document" "assume-role-ecs-task" {
  statement {
    effect  = "Allow"
    actions = ["sts:AssumeRole"]

    principals {
      identifiers = ["ecs-tasks.amazonaws.com"]
      type        = "Service"
    }
  }
}

data "aws_iam_policy_document" "ecs-task" {
  statement {
    effect  = "Allow"
    actions = ["ec2:Describe*"]

    resources = [
      "*",
    ]
  }
}

resource "aws_iam_policy" "ecs-task" {
  name        = "${var.service-name}-${var.env-short}-ecs-task"
  path        = "/service-role/"
  description = "Policy for Container"
  policy      = "${data.aws_iam_policy_document.ecs-task.json}"
}

resource "aws_iam_role" "ecs-task" {
  name               = "${var.service-name}-${var.env-short}-ecs-task"
  path               = "/"
  assume_role_policy = "${data.aws_iam_policy_document.assume-role-ecs-task.json}"
  description        = "Allows ECS tasks to call AWS services on your behalf."
}

resource "aws_iam_role_policy_attachment" "ecs-task" {
  role       = "${aws_iam_role.ecs-task.name}"
  policy_arn = "${aws_iam_policy.ecs-task.arn}"
}

# ECS Task Execution Role
data "aws_iam_policy_document" "assume-role-ecs-task-execution" {
  statement {
    effect  = "Allow"
    actions = ["sts:AssumeRole"]

    principals {
      identifiers = ["ecs-tasks.amazonaws.com"]
      type        = "Service"
    }
  }
}

resource "aws_iam_role" "ecs-task-execution" {
  name               = "${var.service-name}-${var.env-short}-ecs-task-execution"
  path               = "/"
  assume_role_policy = "${data.aws_iam_policy_document.assume-role-ecs-task-execution.json}"
  description        = "Allows ECS tasks execution."
}

resource "aws_iam_role_policy_attachment" "ecs-task-execution" {
  role       = "${aws_iam_role.ecs-task-execution.name}"
  policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonECSTaskExecutionRolePolicy"
}
