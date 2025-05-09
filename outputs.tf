# output "alb_dns_name" {
#   description = "DNS do Load Balancer"
#   value       = module.alb.alb_dns_name
# }

# output "rds_endpoint" {
#   description = "Endpoint da instância RDS"
#   value       = module.rds.rds_endpoint
# }

# output "web_url" {
#   description = "URL para acessar a aplicação web"
#   value       = "http://${module.alb.alb_dns_name}"
# }


output "eks_cluster_name" {
  value = module.data_sources.eks_cluster_name
}

output "node_group_name" {
  description = "Nome do Node Group criado"
  value       = module.node_group.node_group_name
}

output "node_group_arn" {
  description = "ARN do Node Group"
  value       = module.node_group.node_group_arn
}