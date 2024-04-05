
# ----------------------------------------------------
# Data Source para obtener el ID de la VPC por defecto
# ----------------------------------------------------
data "aws_vpc" "default" {
  default = true
}
