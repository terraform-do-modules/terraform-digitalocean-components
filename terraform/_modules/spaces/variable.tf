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

variable "acl" {
  type        = string
  default     = null
  description = "Canned ACL applied on bucket creation (private or public-read)."
}

variable "force_destroy" {
  type        = bool
  default     = false
  description = "Unless true, the bucket will only be destroyed if empty (Defaults to false)."
}