# resource "aws_db_subnet_group" "default" {
#   name       = "rds-subnet-group"
#   subnet_ids = var.private_subnet_ids

#   tags = {
#     Name    = "rds-subnet-group"
#     Alunos  = "leam-lhcc"
#     Periodo = "8"
#   }
# }

# resource "aws_db_instance" "default" {
#   identifier         = "rds-instance"
#   allocated_storage  = 20
#   engine             = "mysql"
#   engine_version     = "5.7"
#   instance_class     = "db.t3.micro"
#   db_name            = "mydb"
#   username           = "admin"
#   password           = "password123"
#   skip_final_snapshot = true
#   db_subnet_group_name = aws_db_subnet_group.default.name
#   vpc_security_group_ids = [var.rds_sg_id]
#   multi_az               = false
#   publicly_accessible    = false
#   backup_retention_period = 7

#   tags = {
#     Name    = "rds-instance"
#     Alunos  = "leam-lhcc"
#     Periodo = "8"
#   }
# }
