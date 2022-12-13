output "private_subnets" {
  description = "List of IDs of subnets created"
  value       = aws_subnet.subnet.*.id
}

output "subnet_arns" {
  description = "List of ARNs of subnets created"
  value       = aws_subnet.subnet.*.arn
}

output "cidr_blocks" {
  description = "List of cidr_blocks of subnets create"
  value       = aws_subnet.subnet.*.cidr_block
}

