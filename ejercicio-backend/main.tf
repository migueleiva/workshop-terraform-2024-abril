resource "aws_instance" "ejemplo-tf-3" {
  ami           = "ami-2757f631"
  instance_type = "t2.micro"
  //name = "mi-server"
  tags = {
    Name = "mi-servidor-tf-3-dddddddd"
  }
}

