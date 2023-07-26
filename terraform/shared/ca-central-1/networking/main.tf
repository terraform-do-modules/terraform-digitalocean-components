provider "aws" {
  region = "ca-central-1"
}

terraform {
  backend "s3" {
    bucket = "<bucketname>"
    key    = "ca-central-1/shared/networking.tfstate"
    region = "ca-central-1"
  }
}

module "s3_bucket" {
  source  = "clouddrove/s3/aws"
  version = "0.14.0"

  bucket_enabled = true
  versioning     = true

  name        = "logs"
  environment = var.environment
  label_order = var.label_order

  acl = "private"
}

module "vpc" {
  source  = "clouddrove/vpc/aws"
  version = "0.14.0"

  vpc_enabled     = true
  enable_flow_log = true

  name        = "vpc"
  environment = var.environment
  label_order = var.label_order

  cidr_block    = "10.0.0.0/16"
  s3_bucket_arn = module.s3_bucket.arn
}


module "subnets" {
  source  = "clouddrove/subnet/aws"
  version = "0.14.0"

  nat_gateway_enabled = true

  name        = "subnets"
  environment = var.environment
  label_order = var.label_order

  availability_zones = ["ca-central-1a", "ca-central-1b", "ca-central-1c"]
  vpc_id             = module.vpc.vpc_id
  type               = "public-private"
  igw_id             = module.vpc.igw_id
  cidr_block         = module.vpc.vpc_cidr_block
  ipv6_cidr_block    = module.vpc.ipv6_cidr_block
}
