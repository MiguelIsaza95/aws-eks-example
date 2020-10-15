resource "aws_instance" "bastion" {
  monitoring                  = true
  ami                         = data.aws_ami.ubuntu_18_latest.id
  instance_type               = var.instance_type
  key_name                    = var.key_name
  security_groups             = [aws_security_group.bastion_sg.id]
  associate_public_ip_address = true
  subnet_id                   = element(aws_subnet.dmz_public.*.id, 0)
  user_data                   = filebase64("${path.module}/bastion.sh")
  tags = {
    Name        = "bastion"
    Environment = "Test"
  }
  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_instance" "nat" {
  monitoring                  = true
  ami                         = data.aws_ami.nat_latest.id
  instance_type               = var.instance_type
  key_name                    = var.key_name
  security_groups             = [aws_security_group.nat_sg.id]
  associate_public_ip_address = true
  subnet_id                   = element(aws_subnet.dmz_public.*.id, 1)
  tags = {
    Name        = "nat"
    Environment = "Test"
  }
  lifecycle {
    create_before_destroy = true
  }
  source_dest_check = false
}

resource "aws_instance" "jenkins" {
  monitoring                  = true
  ami                         = data.aws_ami.jenkins_latest.id
  instance_type               = "t3.medium"
  key_name                    = var.key_name
  associate_public_ip_address = true
  vpc_security_group_ids      = [aws_security_group.jenkins_sg.id]
  subnet_id                   = element(aws_subnet.dmz_public.*.id, 2)
  tags = {
    Name        = "jenkins"
    Environment = "Test"
  }
  lifecycle {
    create_before_destroy = true
  }
}