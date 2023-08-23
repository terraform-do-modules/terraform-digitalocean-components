#Module      : LABEL
#Description : Terraform label module variables.
variable "name" {
  type        = string
  default     = ""
  description = "Name  (e.g. `app` or `cluster`)."
}

variable "environment" {
  type        = string
  default     = ""
  description = "Environment (e.g. `prod`, `dev`, `staging`)."
}

variable "enabled" {
  type        = bool
  default     = true
  description = "Flag to control the resources creation."
}

variable "cluster_engine" {
  type        = string
  default     = ""
  description = "Database engine used by the cluster (ex. pg for PostreSQL, mysql for MySQL, redis for Redis, or mongodb for MongoDB)"
}

variable "cluster_version" {
  type        = string
  default     = ""
  description = "The version of the cluster"
}

variable "cluster_size" {
  type        = string
  default     = "db-s-1vcpu-1gb"
  description = "Database Droplet size associated with the cluster (ex. db-s-1vcpu-1gb)"

}

variable "region" {
  type        = string
  default     = null
  description = "DigitalOcean region where the cluster will reside"
}

variable "cluster_node_count" {
  type        = number
  default     = 1
  description = "Number of nodes that will be included in the cluster"
}

variable "cluster_private_network_uuid" {
  type        = string
  default     = null
  description = "The ID of the VPC where the database cluster will be located"
}

variable "mysql_sql_mode" {
  type        = string
  default     = null
  description = "A comma separated string specifying the SQL modes for a MySQL cluster."
}

variable "cluster_maintenance" {
  type        = map(string)
  default     = null
  description = "The day and the start hour of the maintenance window policy"
}

variable "databases" {
  type        = list(string)
  default     = []
  description = "A list of databases in the cluster"
}

variable "users" {
  type        = list(map(string))
  default     = null
  description = "A list of users in the cluster"
}

variable "create_firewall" {
  type        = bool
  default     = false
  description = "Controls if firewall should be created"
}

variable "firewall_rules" {
  type        = list(map(string))
  default     = []
  description = "List of firewall rules associated with the cluster"
}