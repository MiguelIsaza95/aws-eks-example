resource "aws_route53_zone" "private" {
  name = "javaspring.org"

  vpc {
    vpc_id = aws_vpc.test.id
  }
}