# Recurso para crear usuarios de IAM utilizando `count`
resource "aws_iam_user" "users" {
  count = length(var.user_names)  # `count` especifica cuántos usuarios se deben crear
  name = var.user_names[count.index]  # Usa el índice de `count` para acceder al nombre de usuario
  # Por ejemplo, puedes agregar etiquetas:
  tags = {
    Name = var.user_names[count.index]
  }
}
