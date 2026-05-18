resource "aws_security_group" "my-security-group" {
    name="webserver-sg"
    vpc_id = aws_vpc.aws_static_website_hosting.id
    description = "allow all"

    ingress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }
    
    egress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }
}
