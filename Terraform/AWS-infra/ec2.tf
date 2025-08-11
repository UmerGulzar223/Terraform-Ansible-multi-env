
resource "aws_key_pair" "key-pair" {
  key_name   = "${var.env}-key-pair"
  public_key = file("key-pair-for-TAME.pub")
  tags = {
    Name = "${var.env}-key-pair"
    Environment = var.env
  }
}

resource "aws_default_vpc" "default" {

}

resource "aws_security_group" "aws-sg" {
    name = "${var.env}-sg"
    description = "Security group for the instance"
    vpc_id = aws_default_vpc.default.id

    tags = {
        Name = "${var.env}-sg"
        Environment = var.env
    }
}


resource "aws_vpc_security_group_ingress_rule" "aws-sg-ingress1" {
  security_group_id = aws_security_group.aws-sg.id

  cidr_ipv4   = "0.0.0.0/0"
  from_port   = 22
  ip_protocol = "tcp"
  to_port     = 22
}

resource "aws_vpc_security_group_ingress_rule" "aws-sg-ingress2" {
  security_group_id = aws_security_group.aws-sg.id

  cidr_ipv4   = "0.0.0.0/0"
  from_port   = 80
  ip_protocol = "tcp"
  to_port     = 80
}

resource "aws_vpc_security_group_egress_rule" "aws-sg-egress" {
  security_group_id = aws_security_group.aws-sg.id

  cidr_ipv4   = "0.0.0.0/0"
  ip_protocol = "-1"
}

resource "aws_instance" "my_instance" {
  count=var.instance_count
  ami           = var.ami_id
  instance_type = var.instance_type
  key_name      = aws_key_pair.key-pair.key_name
  security_groups = [aws_security_group.aws-sg.name]

  root_block_device {
    volume_size = var.volume_size
    volume_type = var.volume_type
  }

  tags = {
    Name = "${var.env}-instance"
    Environment = var.env
  }
}