# resource "aws_launch_template" "web" {
#   name_prefix   = "web-"
#   image_id      = "ami-071226ecf16aa7d96" # Amazon Linux 2 (região us-east-1)
#   instance_type = var.instance_type

#   network_interfaces {
#     associate_public_ip_address = true
#     security_groups             = [var.ec2_public_sg_id]
#   }

#   user_data = filebase64("${path.module}/user_data.sh")

#   tag_specifications {
#     resource_type = "instance"
#     tags = {
#       Name    = "web-instance"
#       Alunos  = "leam-lhcc"
#       Periodo = "8"
#     }
#   }
# }

# resource "aws_autoscaling_group" "web" {
#   desired_capacity     = var.desired_capacity
#   max_size             = var.max_size
#   min_size             = var.min_size
#   vpc_zone_identifier  = var.public_subnet_ids

#   launch_template {
#     id      = aws_launch_template.web.id
#     version = "$Latest"
#   }

#   target_group_arns = [aws_lb_target_group.web.arn]
# }

# resource "aws_lb_target_group" "web" {
#   name     = "web-target-group"
#   port     = 80
#   protocol = "HTTP"
#   vpc_id   = var.vpc_id

#   health_check {
#     path                = "/"
#     protocol            = "HTTP"
#     interval            = 30
#     timeout             = 5
#     healthy_threshold   = 2
#     unhealthy_threshold = 2
#   }

#   tags = {
#     Name    = "web-target-group"
#     Alunos  = "leam-lhcc"
#     Periodo = "8"
#   }
# }
