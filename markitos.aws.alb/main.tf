resource "aws_lb" "markitos_aws_alb_ecs_alb" {
  name               = "ecs-alb"
  internal           = true
  load_balancer_type = "application"
  security_groups    = var.markitos_aws_alb_security_groups_ids
  subnets            = var.markitos_aws_alb_subnets_ids

  tags = {
    Name = "ecs-alb"
  }
}

resource "aws_lb_listener" "markitos_aws_alb_ecs_alb_listener" {
  load_balancer_arn = aws_lb.markitos_aws_alb_ecs_alb.arn
  port              = var.markitos_aws_alb_aws_lb_listener_port
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.markitos_aws_alb_aws_lb_target_group.arn
  }
}

resource "aws_lb_target_group" "markitos_aws_alb_aws_lb_target_group" {
  name        = "markitos-aws-alb-ecs-tg-ecs-tg"
  port        = var.markitos_aws_alb_aws_lb_target_group_port
  protocol    = "HTTP"
  target_type = "ip"
  vpc_id      = var.markitos_aws_alb_vpc_id

  health_check {
    path = "/"
  }
}
