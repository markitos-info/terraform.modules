resource "aws_ecs_task_definition" "markitos_aws_ecs_ec2_ecs_task_definition" {
  family       = "service"
  network_mode = "awsvpc"
  container_definitions = jsonencode([
    {
      name      = "first"
      image     = "service-first"
      cpu       = 1
      memory    = 256
      essential = true
      portMappings = [
        {
          containerPort = 80
          hostPort      = 80
        }
      ]
    }
  ])

  volume {
    name      = "service-storage"
    host_path = "/ecs/service-storage"
  }

  placement_constraints {
    type       = "memberOf"
    expression = "attribute:ecs.availability-zone in [eu-west-1a, eu-west-1b]"
  }

  tags = (merge(local.tags, {
    Name = "${var.markitos_aws_ecs_ec2_project_name}-markitos_aws_ecs_ec2_ecs_cluster"
  }))
}


resource "aws_ecs_service" "markitos_aws_ecs_ec2_ecs_service" {
  name            = "markitos_aws_ecs_ec2_ecs_service"
  cluster         = aws_ecs_cluster.markitos_aws_ecs_ec2_ecs_cluster.id
  task_definition = aws_ecs_task_definition.markitos_aws_ecs_ec2_ecs_task_definition.arn
  desired_count   = 2

  network_configuration {
    subnets         = var.markitos_aws_ecs_ec2_subnets_ids
    security_groups = var.markitos_aws_ecs_ec2_security_group_ids
  }

  force_new_deployment = true
  placement_constraints {
    type = "distinctInstance"
  }

  triggers = {
    redeployment = timestamp()
  }

  # capacity_provider_strategy {
  #   capacity_provider = aws_ecs_capacity_provider.ecs_capacity_provider.name
  #   weight            = 100
  # }

  # load_balancer {
  #   target_group_arn = var.markitos_aws_ecs_ec2_lb_target_group_arn
  #   container_name   = "dockergs"
  #   container_port   = 80
  # }

  # depends_on = [aws_autoscaling_group.ecs_asg]

  tags = (merge(local.tags, {
    Name = "${var.markitos_aws_ecs_ec2_project_name}-markitos_aws_ecs_ec2_ecs_service"
  }))
}


resource "aws_ecs_cluster" "markitos_aws_ecs_ec2_ecs_cluster" {
  name = "${var.markitos_aws_ecs_ec2_project_name}-markitos_aws_ecs_ec2_ecs_cluster"
  tags = (merge(local.tags, {
    Name = "${var.markitos_aws_ecs_ec2_project_name}-markitos_aws_ecs_ec2_ecs_cluster"
  }))
}
