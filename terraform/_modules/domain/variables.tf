# ------------------------------------------------------------------------------
# Variables
# ------------------------------------------------------------------------------
variable "name" {
  type        = string
  default     = ""
  description = "The name of the domain."
}
variable "records" {
  type        = map(any)
  default     = {}
  description = "Provides a DigitalOcean DNS record resource."
}
variable "enabled" {
  type        = bool
  default     = true
  description = "Whether to create the resources. Set to `false` to prevent the module from creating any resources."
}