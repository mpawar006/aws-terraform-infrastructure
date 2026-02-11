resource "aws_security_group" "app_sg" {
  name        = "app-server-sg"
  vpc_id      = var.vpc_id

  # Only allow traffic from the Load Balancer
  ingress {
    from_port       = 80
    to_port         = 80
    protocol        = "tcp"
    security_groups = [var.alb_sg_id]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_launch_template" "app" {
  name_prefix   = "mahesh-app-template"
  image_id      = "ami-0440d3b780d96b29d" # Amazon Linux 2023 (Verify for your region)
  instance_type = "t2.micro"

  vpc_security_group_ids = [aws_security_group.app_sg.id]

  user_data = base64encode(<<-EOF
              #!/bin/bash
              yum update -y
              yum install -y httpd
              systemctl start httpd
              systemctl enable httpd
              echo "<h1>AWS Infrastructure - Deployed by Mahesh Pawar</h1>" > /var/www/html/index.html
              EOF
  )
}

resource "aws_autoscaling_group" "app" {
  desired_capacity    = 2
  max_size            = 4
  min_size            = 1
  vpc_zone_identifier = var.private_subnet_ids
  target_group_arns   = [var.target_group_arn]

  launch_template {
    id      = aws_launch_template.app.id
    version = "$Latest"
  }
}
