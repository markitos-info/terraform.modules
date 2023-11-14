resource "aws_autoscaling_group" "markitos_aws_asg_template_aws_autoscaling_group" {
  vpc_zone_identifier = var.markitos_aws_asg_template_vpc_zone_identifier_ids
  desired_capacity    = var.markitos_aws_asg_template_desired_capacity
  max_size            = var.markitos_aws_asg_template_max_size
  min_size            = var.markitos_aws_asg_template_min_size

  launch_template {
    id      = var.markitos_aws_asg_template_launch_template_id
    version = "$Latest"
  }

  tag {
    key                 = "AmazonECSManaged"
    value               = true
    propagate_at_launch = true
  }
}
