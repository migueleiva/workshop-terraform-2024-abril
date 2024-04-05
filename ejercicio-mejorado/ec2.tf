
# ---------------------------------------
# Define una instancia EC2 con AMI Ubuntu
# ---------------------------------------
resource "aws_instance" "mi_servidor" {
  ami                    = "ami-xxxxxxxxx"
  instance_type          = "t3.large"
  #vpc_security_group_ids = "mifireall" 
  vpc_security_group_ids = [aws_security_group.mi_grupo_de_seguridad.id]

  user_data = <<-EOF
              #!/bin/bash
              echo "Hola Grupo de Terraformers!" > index.html
              nohup busybox httpd -f -p 8080 &
              EOF
}
