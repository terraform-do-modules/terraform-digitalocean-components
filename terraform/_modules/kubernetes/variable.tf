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

variable "enabled" {
  type        = bool
  default     = true
  description = "Whether to create the resources. Set to `false` to prevent the module from creating any resources."
}

variable "region" {
  type        = string
  default     = "blr1"
  description = "K8s Cluster Region."
}

variable "cluster_version" {
  type        = string
  default     = "1.27.2"
  description = "K8s Cluster Version."
}

variable "vpc_uuid" {
  type        = string
  default     = ""
  description = "The ID of the VPC where the Kubernetes cluster will be located."
}

variable "critical_node_pool" {
  type        = any
  default     = {}
  description = "Cluster default node pool."
}

variable "app_node_pools" {
  type        = map(any)
  default     = {}
  description = "Cluster additional node pools."
}
