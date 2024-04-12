# Fuente de datos para recuperar un usuario IAM existente por su nombre
data "aws_iam_user" "user_cloud" {
  user_name = "miguel"
}

# Output para mostrar el ARN del usuario IAM
output "iam_user_arn" {
  value = data.aws_iam_user.user_cloud.arn
}


# Fuente de datos para recuperar una VPC existente por su nombre
data "aws_vpc" "example_vpc" {
  tags = {
    Name = "default"  # Reemplaza "my-vpc" con el nombre de la VPC
  }
}

data "aws_subnet" "subnet_default" {
  filter {
    name   = "tag:Name"
    values = ["subred3"]
  }
}

# Output para mostrar los IDs de las subredes
output "subnet_id" {
  value = data.aws_subnet.subnet_default.id
}

# Fuente de datos para recuperar una función Lambda existente por su nombre
data "aws_lambda_function" "my_lambda_function" {
  function_name = "funcion-lambda-prueba-datasource"  # Reemplaza "my-lambda-function" con el nombre de la función Lambda
}

# Output para mostrar el ARN de la función Lambda
output "lambda_function_arn" {
  value = data.aws_lambda_function.my_lambda_function.arn
}

output "lambda_function" {
  value = data.aws_lambda_function.my_lambda_function
}