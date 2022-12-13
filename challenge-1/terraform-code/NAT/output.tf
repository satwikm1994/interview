#output "private_route_table_ids" {
#  description = "List of IDs of private route tables"
#  value       = aws_route_table.private.*.id
#}

output "nat_ids" {
  description = "List of allocation ID of Elastic IPs created for AWS NAT Gateway"
  value       = aws_eip.public.*.id
}
