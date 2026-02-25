##------------------------------------------------
## Compatible with:
##   Terraform  >= 1.5.4  (https://www.terraform.io)
##   OpenTofu   >= 1.6.0  (https://opentofu.org)
##------------------------------------------------
terraform {
  required_version = ">= 1.5.4"

  required_providers {
    digitalocean = {
      source  = "digitalocean/digitalocean"
      version = ">= 2.29.0"
    }
  }
}
