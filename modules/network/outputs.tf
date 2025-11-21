output "vpc_id" {
  value = aws_vpc.this.id
}

output "private_subnet_id" {
  value = aws_subnet.private.id
}

output "ec2_id" {
  value = aws_instance.private_ec2.id
}
