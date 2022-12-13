output "endpoint_id" {
  description = "List of endpoint IDs "
  value       = aws_vpc_endpoint.ssm_endpoint.*.id
}
