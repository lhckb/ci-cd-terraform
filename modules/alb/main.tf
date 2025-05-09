# resource "aws_lb" "web" {
#   name               = "web-alb"
#   internal           = false
#   load_balancer_type = "application"
#   security_groups    = [var.alb_sg_id]
#   subnets            = var.public_subnet_ids

#   enable_deletion_protection = false

#   tags = {
#     Name    = "web-alb"
#     Alunos  = "leam-lhcc"
#     Periodo = "8"
#   }
# }

# resource "aws_lb_listener" "web" {
#   load_balancer_arn = aws_lb.web.arn
#   port              = 80
#   protocol          = "HTTP"

#   default_action {
#     type             = "forward"
#     target_group_arn = var.asg_target_group_arn
#   }

#   tags = {
#     Name    = "web-alb-listener"
#     Alunos  = "leam-lhcc"
#     Periodo = "8"
#   }
# }
