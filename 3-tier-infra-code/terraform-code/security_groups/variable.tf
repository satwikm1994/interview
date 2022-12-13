#.........................
variable "add_ssh_security_group" {
  type        = bool
  description = "Boolean value to create firewall rule to allow SSH"
}


variable "add_endpoints_security_group" {
  type        = bool
  description = "Boolean value to endpoint_security_group to allow https on 443 port"
}

variable "add_redis_security_group" {
  type        = bool
  description = "Boolean value to create firewall rule to allow redis connections"
}

variable "nodes_cidr" {
  description = "A list Nodes CIDR range belonging to private subnet"
  type        = list(string)
  default     = []
}

variable "db_cidr" {
  description = "A list DB CIDR range belonging to private subnet"
  type        = list(string)
  default     = []
}

variable "pods_cidr" {
  description = "A list Pods CIDR range belonging to private subnet"
  type        = list(string)
  default     = []
}

variable "add_media_server_security_group" {
  type        = bool
  description = "Boolean value to create firewall rule to allow media server connections"
}
variable "add_victoria_metrics_security_group" {
  type        = bool
  description = "Boolean value to create firewall rule to allow victoria metrics connections"
}

variable "add_influxdb_security_group" {
  type        = bool
  description = "Boolean value to create firewall rule to allow influx connections"
}

variable "add_clickhouse_security_group" {
  type        = bool
  description = "Boolean value to create firewall rule for clickhouse"
}

variable "add_vault_security_group" {
  type        = bool
  description = "Boolean value to create firewall rule for vault"
}

variable "add_janus_ms_security_group" {
  type        = bool
  description = "Boolean value to create firewall rule for janus ms"
}

variable "add_turn_server_security_group" {
  type        = bool
  description = "Boolean value to create firewall rule for janus ms"
}

variable "add_global_accelerator_security_group" {
  type        = bool
  description = "Boolean value to create firewall rule for global accelerator"
}

variable "add_rds_ingress_security_group" {
  type        = bool
  description = "Boolean value to create firewall rule for RDS ingress to access traffic from private nodes CIDR"
}

variable "global_accelerator_cidr" {
  type        = list(string)
  description = "Global accelerator CIDR"
  default     = []
}

variable "universe_name" {
  type        = string
  description = "universe name"
}

variable "vpc_cidr" {
  type        = list(string)
  description = "vpc cidr blocks"
}

variable "vpc_name" {
  type        = string
  description = "vpc name"
}

variable "add_rabbitmq_sg" {
  type        = bool
  description = "Boolean value to create rabbitmq securoty group"
}

variable "add_packer_security_group" {
  type        = bool
  description = "For creating image through packer"
}