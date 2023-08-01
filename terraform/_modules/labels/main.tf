provider "digitalocean" {}

##----------------------------------
## Labels module call
##----------------------------------
module "labels" {
  source      = "terraform-do-modules/labels/digitalocean"
  version     = "1.0.0"
  name        = "labels"
  environment = "test"
  label_order = ["name", "environment"]
  attributes  = ["private"]
}