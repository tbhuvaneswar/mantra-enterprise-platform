resource "aws_lb" "app_alb" {

  name               = "mantra-alb"
  internal           = false
  load_balancer_type = "application"

  security_groups = [var.alb_sg]
  subnets         = var.public_subnets

}

resource "aws_lb_target_group" "app_tg" {

  name     = "mantra-tg"
  port     = var.target_port
  protocol = "HTTP"

  vpc_id = var.vpc_id

  health_check {

    path = "/"
    port = "traffic-port"

    healthy_threshold   = 2
    unhealthy_threshold = 2

    timeout  = 5
    interval = 30

  }

}

resource "aws_lb_listener" "http_listener" {

  load_balancer_arn = aws_lb.app_alb.arn

  port     = 80
  protocol = "HTTP"

  default_action {

    type             = "forward"
    target_group_arn = aws_lb_target_group.app_tg.arn

  }

}
