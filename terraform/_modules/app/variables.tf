##-------------------------------------------------------
## variable
##-------------------------------------------------------
variable "enabled" {
  type        = bool
  default     = true
  description = "Flag to control the resources creation."
}

variable "spec" {
  description = "(Required) A DigitalOcean App spec describing the app."
  type        = any
  default     = []
}