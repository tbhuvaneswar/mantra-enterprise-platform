resource "aws_launch_template" "mantra_template" {

  name_prefix   = "mantra-launch-template"
  image_id      = var.ami_id
  instance_type = var.instance_type

  vpc_security_group_ids = [
    var.security_group_id
  ]

  iam_instance_profile {
    name = var.instance_profile_name
  }

  user_data = base64encode(<<EOF
#!/bin/bash
/etc/eks/bootstrap.sh ${var.cluster_name}
EOF
)

  tag_specifications {

    resource_type = "instance"

    tags = {
      Name        = "mantra-instance"
      Environment = var.environment
    }

  }

}

resource "aws_autoscaling_group" "mantra_asg" {

  desired_capacity = 2
  max_size         = 3
  min_size         = 2

  vpc_zone_identifier = var.subnet_ids

  launch_template {

    id      = aws_launch_template.mantra_template.id
    version = "$Latest"

  }

  target_group_arns = [var.target_group_arn]

  tag {

    key                 = "Name"
    value               = "mantra-instance"
    propagate_at_launch = true

  }

}
