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

variable "region" {
  type        = string
  default     = "blr-1"
  description = "The region to create VPC, like ``london-1`` , ``bangalore-1`` ,``newyork-3`` ``toronto-1``. "
}

variable "enabled" {
  type        = bool
  default     = true
  description = "Whether to create the resources. Set to `false` to prevent the module from creating any resources."
}

variable "vpc_uuid" {
  type        = string
  default     = ""
  description = "The ID of the VPC where the load balancer will be located."
}

variable "droplet_ids" {
  type        = list(string)
  default     = []
  description = "A list of the IDs of each droplet to be attached to the Load Balancer."
}

variable "enabled_redirect_http_to_https" {
  type        = bool
  default     = false
  description = "A boolean value indicating whether HTTP requests to the Load Balancer on port 80 will be redirected to HTTPS on port 443. Default value is false."
}

variable "forwarding_rule" {
  type        = list(any)
  default     = []
  description = "List of objects that represent the configuration of each forwarding_rule."
}

variable "healthcheck" {
  type        = list(any)
  default     = []
  description = "List of objects that represent the configuration of each healthcheck."
}

variable "sticky_sessions" {
  type        = list(any)
  default     = []
  description = "List of objects that represent the configuration of each healthcheck."
}

variable "firewall" {
  type        = list(any)
  default     = []
  description = "List of objects that represent the configuration of each healthcheck."
}
