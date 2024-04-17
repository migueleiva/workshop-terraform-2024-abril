variable "multiregion" {
  description = "Define if the VPC will be multiregion"
  type        = bool
  default     = false
}

variable "name" {
  description = "Prefix for VPC"
  type        = string
}

variable "environment" {
  description = "Environment"
  type        = string
}

variable "cidr_primary" {
  description = "IP address assignment for data routing - Primary"
  type        = string
}


variable "availability_zones_primary" {
  description = "Availability zones to Primary region, more than one"
  type        = list(string)
}

variable "public_subnets_primary" {
  description = "Public Subnet defined to Primary region"
  type        = list(string)
}



variable "private_subnets_primary" {
  description = "Private Subnet defined to Primary region"
  type        = list(string)
}


variable "database_subnets_primary" {
  description = "Private Subnet defined to Databases on Primary region"
  type        = list(string)
}


variable "nat_ip_ids_primary" {
  description = "List of EIP IDs to be assigned to the NAT Gateways (used in combination with reuse_nat_ips)"
  type        = list(string)
  default     = []
}




variable "nombre" {
  
}


variable "sufijo" {
  
}

variable "ambiente" {
  
}

variable "bloque" {
  
}