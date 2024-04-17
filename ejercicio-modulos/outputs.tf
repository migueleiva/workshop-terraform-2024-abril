output "vpc_id_primary" {
  description = "Primary Vpc ID"
  value       = module.vpc_primary.vpc_id
}


output "public_subnets_primary" {
  description = "Primary Vpc Public Subnet List"
  value       = try(module.vpc_primary.public_subnets)
}



output "private_subnets_primary" {
  description = "Primary Vpc Private Subnet List"
  value       = try(module.vpc_primary.private_subnets)
}



output "database_subnets_primary" {
  description = "Primary Vpc DataBase Subnet List"
  value       = try(module.vpc_primary.database_subnets)
}



output "private_rts_primary" {
  description = "Primary Vpc Route Table List"
  value       = module.vpc_primary.private_rts
}


output "virtual_private_gateway_id_primary" {
  description = "Primary private gateway ID"
  value       = module.vpc_primary.virtual_private_gateway_id
}

output "vpc_tags_primary" {
  description = "Primary vpc tags"
  value       = module.vpc_primary.tags
}
