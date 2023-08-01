# ------------------------------------------------------------------------------
# Outputs
# ------------------------------------------------------------------------------
output "name" {
  value       = module.container-registry[*].name
  description = " The name of the container registry"
}
