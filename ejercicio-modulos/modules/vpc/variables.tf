variable "name" {
  description = "Name of the VPC"
  type        = string
  default     = true
}

variable "environment" {
  description = "Environment to which the vpc belongs"
}

variable "suffix" {
  description = "Suffix of the VPC components"
  type        = string
}

variable "cidr" {
  description = "Cidr of the VPC"
  type        = string
  default     = true
}

variable "availability_zones" {
  description = "availability zones list of the VPC"
  type        = list(string)
}

variable "public_subnets" {
  description = "Public subnet list of the VPC"
  type        = list(string)
}

variable "private_subnets" {
  description = "Private subnet list of the VPC"
  type        = list(string)
}

variable "database_subnets" {
  description = "Database subnet list of the VPC"
  type        = list(any)
}

variable "nat_ip_ids" {
  description = "List of EIP IDs to be assigned to the NAT Gateways (used in combination with reuse_nat_ips)"
  type        = list(string)
  default     = []
}

variable "tags" {
  description = "Tags group of the VPC"
  type        = map(any)
}