output "id" {
  value       = module.lets_encrypt_certificate.id
  description = "The unique ID of the certificate."
}

output "name" {
  value       = module.lets_encrypt_certificate.name
  description = "The name of the certificate."
}