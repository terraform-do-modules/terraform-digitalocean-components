provider "digitalocean" {}

##------------------------------------------------
## VPC module call
##------------------------------------------------
module "vpc" {
  source      = "./../../"
  name        = "app"
  environment = "test"
  region      = "blr1"
  ip_range    = "10.10.0.0/16"
}