# module "vpc" {
#   source = "./modules/vpc"
# }

# module "sg" {
#   source = "./modules/sg"
#   vpc_id = module.vpc.vpc_id
# }

# module "asg" {
#   source             = "./modules/asg"
#   public_subnet_ids  = module.vpc.public_subnet_ids
#   vpc_id             = module.vpc.vpc_id
#   ec2_public_sg_id   = module.sg.ec2_public_sg_id
# }

# module "alb" {
#   source               = "./modules/alb"
#   vpc_id               = module.vpc.vpc_id
#   public_subnet_ids    = module.vpc.public_subnet_ids
#   alb_sg_id            = module.sg.alb_sg_id
#   asg_target_group_arn = module.asg.asg_target_group_arn
# }

# module "rds" {
#   source             = "./modules/rds"
#   private_subnet_ids = module.vpc.private_subnet_ids
#   rds_sg_id          = module.sg.rds_sg_id
#   db_username        = var.db_username
#   db_password        = var.db_password
# }

module "node_group" {
  source            = "./modules/node_group"
  eks_cluster_name  = module.data_sources.eks_cluster_name
  node_group_name   = "nodeGroupDP004"
  subnet_ids        = module.data_sources.subnet_ids
  ec2_ssh_key       = var.ec2_ssh_key
}

module "data_sources" {
  source            = "./data_sources"
  eks_cluster_name  = var.eks_cluster_name
}

module "k8s_app" {
  source = "./modules/k8s_app"
  repository_url = module.ecr.repository_url
}

module "ecr" {
  source           = "./modules/ecr"
  repository_name  = "todo-app-lhcc-leam"
}
