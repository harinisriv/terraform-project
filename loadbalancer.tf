# Creating ALB

resource "aws_lb" "project-LB" {
  name               = "project-LB"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.allow_80.id]
  subnets            = [aws_subnet.public-subnet-1a.id,aws_subnet.public-subnet-1b.id]

  #enable_deletion_protection = true

  tags = {
    Environment = "production"
  }
}

# Creating target group for LB

resource "aws_lb_target_group" "project-targetgroup" {
  name     = "project-targetgroup"
  port     = 80
  protocol = "HTTP"
  vpc_id   = aws_vpc.tf-project-vpc.id

}

# Creating listener for LB

resource "aws_lb_listener" "project-LB-listener" {
  load_balancer_arn = aws_lb.project-LB.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.project-targetgroup.arn
  }
}

# Creating target group attachment to LB

resource "aws_lb_target_group_attachment" "project-LB-tga" {
  target_group_arn = aws_lb_target_group.project-targetgroup.arn
  target_id        = aws_instance.public-instance-1a.id
  port             = 80
}