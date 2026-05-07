variable "name" {
  type        = string
  default     = "app-component"
  description = "Name used across all resources (e.g. `app` or `cluster`)."
}

variable "environment" {
  type        = string
  default     = "test"
  description = "Environment label applied to all resources (e.g. `prod`, `dev`, `staging`)."
}

variable "region" {
  type        = string
  default     = "blr1"
  description = "DigitalOcean region for all resources."
}

variable "ssh_public_key" {
  type        = string
  description = "SSH public key to attach to the Droplet."
  sensitive   = true
}

variable "alert_email" {
  type        = list(string)
  default     = []
  description = "Email addresses to receive monitoring alerts."
}

variable "domain_name" {
  type        = string
  default     = "example.do.clouddrove.com"
  description = "Primary domain name managed by this stack."
}

variable "certificate_domain_names" {
  type        = list(string)
  default     = []
  description = "List of FQDNs for the Let's Encrypt certificate. Must be managed by DigitalOcean DNS."
}
