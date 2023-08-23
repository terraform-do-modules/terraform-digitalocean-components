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

variable "target_url" {
  type        = list(any)
  default     = []
  description = "The endpoint to perform healthchecks on."
}

variable "type" {
  type        = list(string)
  default     = []
  description = "The type of health check to perform: 'ping' 'http' 'https'."
}

variable "enabled" {
  type        = bool
  default     = true
  description = "A boolean value indicating whether the check is enabled/disabled."
}

variable "alert_type" {
  type        = list(any)
  default     = ["down_global"]
  description = "The type of health check to perform. Must be one of latency, down, down_global or ssl_expiry."
}

variable "comparison" {
  type        = list(any)
  default     = ["less_than"]
  description = "The comparison operator used against the alert's threshold. Must be one of greater_than or less_than."
}

variable "period" {
  type        = list(string)
  default     = ["2m"]
  description = "Period of time the threshold must be exceeded to trigger the alert. Must be one of 2m, 3m, 5m, 10m, 15m, 30m or 1h."
}

variable "notifications" {
  type        = list(any)
  default     = []
  description = "The notification settings for a trigger alert."
}