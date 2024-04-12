# Recurso para crear usuarios de IAM usando `for_each`
resource "aws_iam_user" "familia" {
  for_each = toset(var.user_names2)  # Convertimos la lista a un conjunto para eliminar posibles duplicados
  name = each.value  # Usamos `each.value` para obtener el nombre de cada usuario de la lista

  # Puedes agregar otras configuraciones para los usuarios aquí, como políticas, permisos, etc.
  # Por ejemplo, puedes agregar etiquetas:
  tags = {
    Name = each.value
  }
}