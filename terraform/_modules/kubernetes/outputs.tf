# ------------------------------------------------------------------------------
# Outputs
# ------------------------------------------------------------------------------
output "id" {
  value       = module.kubernetes.id
  description = "The id of Kubernetes cluster."
}

output "endpoint" {
  value       = module.kubernetes.endpoint
  description = "The base URL of the API server on the Kubernetes master node."
}