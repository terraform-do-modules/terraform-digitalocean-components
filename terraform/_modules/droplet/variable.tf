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

variable "region" {
  type        = string
  default     = "blr1"
  description = "The region to create VPC, like ``blr1``"
}

variable "enabled" {
  type        = bool
  default     = true
  description = "Whether to create the resources. Set to `false` to prevent the module from creating any resources."
}

variable "vpc_id" {
  type        = string
  default     = ""
  description = "The ID of the VPC where the Droplet will be located."
}

variable "ssh_key" {
  type        = string
  default     = ""
  description = "SSH key"
}

variable "inbound_rules" {
  type        = any
  default     = []
  description = "List of objects that represent the configuration of each inbound rule."
}

variable "user_data" {
  type        = string
  default     = null
  description = "(Optional) A string of the desired User Data for the Droplet."
}