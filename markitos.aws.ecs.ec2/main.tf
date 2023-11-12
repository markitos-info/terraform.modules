resource "aws_launch_template" "markitos_aws_ecs_ec2_launch_template" {
  name_prefix            = var.markitos_aws_ecs_ec2_launch_template_name_prefix
  image_id               = var.markitos_aws_ecs_ec2_launch_template_image_id
  instance_type          = var.markitos_aws_ecs_ec2_launch_template_instance_type
  key_name               = "${var.markitos_aws_ecs_ec2_launch_template_name_prefix}_key_name_ecs_ec2_glog"
  vpc_security_group_ids = var.markitos_aws_ecs_ec2_vpc_security_group_ids

  iam_instance_profile {
    name = "ecsInstanceRole"
  }

  block_device_mappings {
    device_name = "/dev/xvda"
    ebs {
      volume_size = 30
      volume_type = "gp2"
    }
  }

  tag_specifications {
    resource_type = "instance"
    tags = (merge(local.tags, {
      Name = "${var.markitos_aws_ecs_ec2_project_name}-markitos_aws_ecs_ec2_launch_template"
    }))
  }

  user_data = filebase64("${path.module}/ecs.sh")
}

resource "aws_ecs_cluster" "markitos_aws_ecs_ec2_ecs_cluster" {
  name = "${var.markitos_aws_ecs_ec2_project_name}-markitos_aws_ecs_ec2_ecs_cluster"
  tags = (merge(local.tags, {
    Name = "${var.markitos_aws_ecs_ec2_project_name}-markitos_aws_ecs_ec2_ecs_cluster"
  }))
}
