locals {
  webserver_init = <<-EOF
    #!/bin/bash
    apt-get update -y
    apt-get upgrade -y
    apt-get install -y nginx
  EOF
}

resource "aws_instance" "webserver" {
    ami = data.aws_ami.ubuntu
    instance_type = "t3.micro"
    subnet_id = aws_subnet.my-public-subnet
    associate_public_ip_address = true
    user_data = local.webserver_init

    vpc_security_group_ids = [aws_security_group.my-security-group.id]

    tags = {
      "Name" = "webserver"
    }
}
