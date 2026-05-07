# ------------------------------------------------------------------------------
# Variables
# ------------------------------------------------------------------------------
variable "enabled" {
  type        = bool
  default     = true
  description = "Whether to create the resources. Set to `false` to prevent the module from creating any resources."
}

variable "origin" {
  type        = string
  default     = ""
  description = "The fully qualified domain name, (FQDN) for a Space."
}

variable "ttl" {
  type        = number
  default     = 3600
  description = "The time to live for the CDN Endpoint, in seconds. Default is 3600 seconds."
}

variable "certificate_name" {
  type        = string
  default     = null
  description = "The unique name of a DigitalOcean managed TLS certificate used for SSL when a custom subdomain is provided."
}

variable "custom_domain" {
  type        = string
  default     = null
  description = "The fully qualified domain name (FQDN) of the custom subdomain used with the CDN Endpoint."
}
