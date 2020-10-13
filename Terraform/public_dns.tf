resource "aws_route53_zone" "primary" {
  name = "movieanalyst.tk"
}

resource "aws_route53_record" "ci" {
  zone_id = aws_route53_zone.primary.zone_id
  name    = "ci"
  type    = "A"
  ttl     = 300
  records = [aws_instance.jenkins.public_ip]
}

resource "aws_route53_record" "secure" {
  zone_id = aws_route53_zone.primary.zone_id
  name    = "secure"
  type    = "A"
  ttl     = 300
  records = [aws_instance.bastion.public_ip]
}
