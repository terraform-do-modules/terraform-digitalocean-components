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

variable "label_order" {
  type        = list(any)
  default     = ["name", "environment"]
  description = "Label order, e.g. `name`,`application`."
}
variable "managedby" {
  type        = string
  default     = "terraform-do-modules"
  description = "ManagedBy, eg 'terraform-do-modules' or 'hello@clouddrove.com'"
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

variable "replica_region" {
  type        = string
  default     = null
  description = "DigitalOcean region where the replica will reside"
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

variable "redis_eviction_policy" {
  type        = string
  default     = null
  description = "A string specifying the eviction policy for a Redis cluster. Valid values are: noeviction, allkeys_lru, allkeys_random, volatile_lru, volatile_random, or volatile_ttl"
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
variable "backup_restore" {
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

variable "create_pools" {
  type        = bool
  default     = false
  description = "Controls if pools should be created"
}

variable "pools" {
  type        = list(map(string))
  default     = null
  description = "A list of connection pools in the cluster"
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
variable "project_id" {
  type        = string
  default     = null
  description = "The ID of the project that the database cluster is assigned to. If excluded when creating a new database cluster, it will be assigned to your default project."
}

variable "replica_size" {
  type        = string
  default     = "db-s-1vcpu-1gb"
  description = "Database Droplet size associated with the replica (ex. db-s-1vcpu-1gb). Note that when resizing an existing replica, its size can only be increased. Decreasing its size is not supported."
}

variable "replica_enable" {
  type        = bool
  default     = false
  description = "Flag to control the resources creation."
}