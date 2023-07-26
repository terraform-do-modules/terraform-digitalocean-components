variable "label_order" {
  description = ""
  default     = ["environment", "name"]
}

variable "environment" {
  description = ""
  default     = "shared"
}

variable "subnet_ids" {
  description = ""
  default     = ""
}

variable "allowed_ip_external" {
  description = ""
  default     = "0.0.0.0/0"
}

variable "allowed_ip_internal" {
  description = ""
  default     = "10.0.0.0/16"
}

variable "vpc_id" {
  description = ""
  default     = ""
}

variable "public_subnet_ids" {
  description = ""
  default     = [""]
}
