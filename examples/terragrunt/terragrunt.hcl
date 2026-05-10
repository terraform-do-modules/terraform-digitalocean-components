##------------------------------------------------
## Terragrunt configuration for terraform-digitalocean-components
##
## Prerequisites:
##   - Terragrunt >= 0.55.0  (https://terragrunt.gruntwork.io)
##   - OpenTofu   >= 1.6.0   (https://opentofu.org)
##     OR Terraform >= 1.5.4 (https://terraform.io)
##   - DIGITALOCEAN_TOKEN env var set
##   - SPACES_ACCESS_KEY_ID and SPACES_SECRET_ACCESS_KEY set (for remote state)
##
## Deploy with Terraform:
##   terragrunt init
##   terragrunt plan
##   terragrunt apply
##
## Deploy with OpenTofu:
##   TERRAGRUNT_TFPATH=tofu terragrunt init
##   TERRAGRUNT_TFPATH=tofu terragrunt plan
##   TERRAGRUNT_TFPATH=tofu terragrunt apply
##
## Destroy:
##   terragrunt destroy
##------------------------------------------------

locals {
  name        = "app-component"
  environment = "test"
  region      = "blr1"
  project     = "myapp"
}

##------------------------------------------------
## Remote state stored in DigitalOcean Spaces (S3-compatible)
## Create the Spaces bucket before running terragrunt init
##------------------------------------------------
remote_state {
  backend = "s3"

  config = {
    endpoint = "https://${local.region}.digitaloceanspaces.com"
    # DO Spaces requires a dummy AWS region value
    region = "us-east-1"
    bucket = "${local.project}-terraform-state"
    key    = "${path_relative_to_include()}/terraform.tfstate"

    skip_credentials_validation = true
    skip_metadata_api_check     = true
    skip_region_validation      = true
    force_path_style            = true
  }

  generate = {
    path      = "backend.tf"
    if_exists = "overwrite_terragrunt"
  }
}

##------------------------------------------------
## Source the complete example from this repo
## Pin to a specific tag for production stability
##------------------------------------------------
terraform {
  source = "git::https://github.com/terraform-do-modules/terraform-digitalocean-components.git//_examples/complete?ref=master"

  ##------------------------------------------------
  ## To use OpenTofu instead of Terraform, set:
  ##   TERRAGRUNT_TFPATH=tofu
  ## or configure terraform_binary in a root terragrunt.hcl:
  ##
  ## terraform {
  ##   terraform_binary = "tofu"
  ## }
  ##------------------------------------------------
}

##------------------------------------------------
## Provider generation — avoids repeating provider
## blocks in every child module
##------------------------------------------------
generate "provider" {
  path      = "provider.tf"
  if_exists = "overwrite_terragrunt"
  contents  = <<-EOF
    provider "digitalocean" {}
  EOF
}

##------------------------------------------------
## Module inputs
##------------------------------------------------
inputs = {
  name        = local.name
  environment = local.environment
  region      = local.region

  ssh_public_key = get_env("DO_SSH_PUBLIC_KEY", "")

  domain_name              = "example.do.clouddrove.com"
  certificate_domain_names = ["example.do.clouddrove.com", "www.example.do.clouddrove.com"]

  alert_email = ["ops@example.com"]
}
