resource "aws_vpc" "this" {
  cidr_block           = var.cidr
  enable_dns_hostnames = true
  enable_dns_support   = true

  tags = merge(
    { "Name" = "vpc-${var.name}-${var.environment}-${var.suffix}"
    },
    var.tags
  )

}

resource "aws_subnet" "public" {
  count = length(var.public_subnets)

  availability_zone = element(var.availability_zones, count.index)
  cidr_block        = element(var.public_subnets, count.index)
  vpc_id            = aws_vpc.this.id

  tags = merge(
    { "Name"                   = "public-${var.name}-${var.environment}-${substr(element(var.availability_zones, count.index), -1, 1)}-${var.suffix}",
      "kubernetes.io/role/elb" = "1"
    },
    var.tags
  )
}

resource "aws_subnet" "private" {
  count = length(var.private_subnets)

  availability_zone = element(var.availability_zones, count.index)
  cidr_block        = element(var.private_subnets, count.index)
  vpc_id            = aws_vpc.this.id

  tags = merge(
    { "Name"                            = "private-${var.name}-${var.environment}-${substr(element(var.availability_zones, count.index), -1, 1)}-${var.suffix}",
      "kubernetes.io/role/internal-elb" = "1"
    },
    var.tags
  )
}

resource "aws_subnet" "database" {
  count = length(var.database_subnets)

  availability_zone = element(var.availability_zones, count.index)
  cidr_block        = element(var.database_subnets, count.index)
  vpc_id            = aws_vpc.this.id

  tags = merge(
    { "Name" = "database-${var.name}-${var.environment}-${substr(element(var.availability_zones, count.index), -1, 1)}-${var.suffix}"
    },
    var.tags
  )
}

resource "aws_internet_gateway" "this" {

  vpc_id = aws_vpc.this.id

  tags = merge(
    { "Name" = "ig-${var.name}-${var.environment}-${var.suffix}"
    },
    var.tags
  )
}

resource "aws_nat_gateway" "this" {
  count = length(var.public_subnets)

  allocation_id = element(var.nat_ip_ids, count.index)
  subnet_id = element(
    aws_subnet.public[*].id, count.index
  )

  tags = merge(
    { "Name" = "nat-${var.name}-${var.environment}-${substr(element(var.availability_zones, count.index), -1, 1)}-${var.suffix}"
    },
    var.tags
  )

  depends_on = [aws_internet_gateway.this]
}

resource "aws_route_table" "public" {
  vpc_id = aws_vpc.this.id

  tags = merge(
    { "Name" = "rt-public-${var.name}-${var.environment}-${var.suffix}"
    },
    var.tags
  )
}

resource "aws_route" "public" {
  route_table_id         = aws_route_table.public.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.this.id
}

resource "aws_route_table_association" "public" {
  count = length(var.public_subnets)

  subnet_id      = element(aws_subnet.public[*].id, count.index)
  route_table_id = aws_route_table.public.id
}

resource "aws_route_table" "private" {
  count = length(var.private_subnets)

  vpc_id = aws_vpc.this.id

  tags = merge(
    { "Name" = "rt-private-${var.name}-${var.environment}-${substr(element(var.availability_zones, count.index), -1, 1)}-${var.suffix}"
    },
    var.tags
  )
}

resource "aws_route" "private" {
  count = length(var.private_subnets)

  route_table_id         = element(aws_route_table.private[*].id, count.index)
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id         = element(aws_nat_gateway.this[*].id, count.index)
}

resource "aws_route_table_association" "private" {
  count = length(var.private_subnets)

  subnet_id      = element(aws_subnet.private[*].id, count.index)
  route_table_id = element(aws_route_table.private[*].id, count.index)
}

resource "aws_route_table" "database" {
  count = length(var.database_subnets)

  vpc_id = aws_vpc.this.id

  tags = merge(
    { "Name" = "rt-database-${var.name}-${var.environment}-${substr(element(var.availability_zones, count.index), -1, 1)}-${var.suffix}"
    },
    var.tags
  )
}

resource "aws_route_table_association" "database" {
  count = length(var.database_subnets)

  subnet_id      = element(aws_subnet.database[*].id, count.index)
  route_table_id = element(aws_route_table.database[*].id, count.index)
}

resource "aws_vpn_gateway" "this" {
  vpc_id = aws_vpc.this.id

  tags = {
    Name = "vpg-${var.name}-${var.environment}-${var.suffix}"
  }
}