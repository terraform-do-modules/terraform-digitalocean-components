##-------------------------------------------------------
## variable
##-------------------------------------------------------
variable "custom_certificate" {
  type        = bool
  default     = false
  description = "A boolean flag to enable/disable custom_certificate."
}

variable "enabled" {
  type        = bool
  default     = true
  description = "Flag to control the resources creation."
}

variable "certificate_name" {
  type        = string
  default     = ""
  description = "The name of the certificate for identification."
}

variable "private_key" {
  type        = string
  default     = ""
  description = "Path of private key."
}

variable "domain_names" {
  type        = list(any)
  default     = []
  description = "List of fully qualified domain names (FQDNs) for which the certificate will be issued. The domains must be managed using DigitalOcean's DNS. Only valid when type is lets_encrypt."
}

variable "leaf_certificate" {
  type        = string
  default     = ""
  description = "Path of certificate body."
}

variable "certificate_chain" {
  type        = string
  default     = ""
  description = "Path of certificate chain."
}

variable "type" {
  type        = string
  default     = "custom"
  description = "The type of certificate to provision"
}

variable "certificate_type" {
  type        = string
  default     = "lets_encrypt"
  description = "The type of certificate to provision"
}