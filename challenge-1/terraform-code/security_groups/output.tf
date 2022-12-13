output "bastion_sg_id" {
  description = "Bastion security group id"
  value       = aws_security_group.allow_ssh.*.id
}

output "endpoint_security_group_id" {
  description = "Endpoint security group id"
  value       = aws_security_group.endpoint_security_group.*.id
}