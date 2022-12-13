output "vpc_id" {
  value       = aws_vpc.interview_main.id
  description = "VPC ID"
}

output "vpc_cidr" {
  value       = aws_vpc.interview_main.cidr_block
  description = "VPC cidr"
}

output "vpc_main_route_table_id" {
  value       = aws_vpc.interview_main.main_route_table_id
  description = "default route table id"
}



