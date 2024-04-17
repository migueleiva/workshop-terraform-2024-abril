output "vpc_id" {
  description = "Inherit Vpc ID"
  value       = aws_vpc.this.id
}

output "public_subnets" {
  description = "Inherit public subnets ids"
  value       = aws_subnet.public[*].id
}

output "private_subnets" {
  description = "Inherit private subnets ids"
  value       = aws_subnet.private[*].id
}

output "database_subnets" {
  description = "Inherit private subnets ids"
  value       = aws_subnet.database[*].id
}

output "public_rt" {
  description = "Inherit public route table ids"
  value       = aws_route_table.public.id
}

output "private_rts" {
  description = "Inherit private route table ids"
  value       = aws_route_table.private[*].id
}

output "virtual_private_gateway_id" {
  description = "Inherit private gateway id"
  value       = aws_vpn_gateway.this.id
}

output "tags" {
  description = "Incremental group tags"
  value       = aws_vpc.this.tags_all
}