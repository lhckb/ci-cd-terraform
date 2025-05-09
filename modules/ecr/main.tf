resource "aws_ecr_repository" "todo_app_repo" {
  name = var.repository_name
  force_delete = true
  
  image_scanning_configuration {
    scan_on_push = var.scan_on_push
  }

  tags = var.tags
}