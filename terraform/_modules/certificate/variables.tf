##-------------------------------------------------------
## variable
##-------------------------------------------------------
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

variable "domain_names" {
  type        = list(any)
  default     = []
  description = "List of fully qualified domain names (FQDNs) for which the certificate will be issued. The domains must be managed using DigitalOcean's DNS. Only valid when type is lets_encrypt."
}