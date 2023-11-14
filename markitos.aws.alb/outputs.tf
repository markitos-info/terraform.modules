output "markitos_aws_alb_output_alb_id" {
  description = "alb id after create"
  value       = aws_lb.markitos_aws_alb_ecs_alb.id
}

output "markitos_aws_alb_output_alb_arn" {
  description = "alb arn after create"
  value       = aws_lb.markitos_aws_alb_ecs_alb.arn
}

output "markitos_aws_alb_lb_target_group_output" {
  description = "alb arn after create"
  value       = aws_lb_target_group.markitos_aws_alb_aws_lb_target_group.arn
}
