output "name" {
  value       = module.droplet[*].name
  description = "The name of the Droplet."
}

output "id" {
  value       = module.droplet.id
  description = "The name of the Droplet."
}