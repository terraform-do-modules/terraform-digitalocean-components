provider "aws" {
  region = "ca-central-1"
}

terraform {
  backend "s3" {
    bucket = "<bucketname>"
    key    = "ca-central-1/security.tfstate"
    region = "ca-central-1"
  }
}
