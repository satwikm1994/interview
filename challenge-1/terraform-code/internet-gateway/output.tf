output "igw_id" {
  description = "The ID of the Internet Gateway"
  value       = aws_internet_gateway.internet_gw.id
}

output "igw_arn" {
  description = "The ARN of the Internet Gateway"
  value       = aws_internet_gateway.internet_gw.arn
}

output "public_route_table_ids" {
  description = "List of IDs of public route tables"
  value       = aws_route_table.public.*.id
}
