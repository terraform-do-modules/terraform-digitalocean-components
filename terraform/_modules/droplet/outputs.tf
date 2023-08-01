output "name" {
  value       = module.droplet[*].name
  description = "The name of the Droplet."
}