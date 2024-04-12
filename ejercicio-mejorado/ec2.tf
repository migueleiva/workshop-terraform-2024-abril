
# ---------------------------------------
# Define una instancia EC2 con AMI Ubuntu
# ---------------------------------------
resource "aws_instance" "mi_servidor" {
  ami                    = "ami-051f8a213df8bc089"
  instance_type          = "t3.large"
  #vpc_security_group_ids = "mifireall" 
  #depedencia implicita
  vpc_security_group_ids = [aws_security_group.mi_grupo_de_seguridad.id]

  user_data = <<-EOF
              #!/bin/bash
              echo "Hola Grupo de Terraformers!" > index.html
              nohup busybox httpd -f -p 8080 &
              EOF

  #dependencia explicita
  depends_on = [
    aws_security_group.mi_grupo_de_seguridad
  ]
}
