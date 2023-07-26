provider "aws" {
  region = "ca-central-1"
}

terraform {
  backend "s3" {
    bucket = "<bucketname>"
    key    = "ca-central-1/shared/vpn.tfstate"
    region = "ca-central-1"
  }
}


module "http-https" {
  source  = "clouddrove/security-group/aws"
  version = "0.14.0"

  name        = "http-https"
  environment = var.environment
  label_order = var.label_order

  vpc_id        = var.vpc_id
  allowed_ports = [80, 443]
  allowed_ip    = [var.allowed_ip_external]

}

module "ssh" {
  source  = "clouddrove/security-group/aws"
  version = "0.14.0"

  name        = "ssh"
  environment = var.environment
  label_order = var.label_order

  vpc_id        = var.vpc_id
  allowed_ip    = [var.allowed_ip_internal]
  allowed_ports = [22]
}

module "kms" {
  source  = "clouddrove/kms/aws"
  version = "0.14.0"

  name        = "kms"
  environment = var.environment
  label_order = var.label_order

  enable_key_rotation = true

  description             = "KMS key for vpn"
  deletion_window_in_days = 7
  alias                   = "alias/vpn"
  policy                  = data.aws_iam_policy_document.kms.json
}

data "aws_iam_policy_document" "kms" {
  version = "2012-10-17"
  statement {
    sid    = "Enable IAM User Permissions"
    effect = "Allow"
    principals {
      type        = "AWS"
      identifiers = ["*"]
    }
    actions   = ["kms:*"]
    resources = ["*"]
  }

}


module "iam-role" {
  source  = "clouddrove/iam-role/aws"
  version = "0.14.0"

  name               = "iam-role"
  environment        = var.environment
  label_order        = var.label_order
  assume_role_policy = data.aws_iam_policy_document.default.json

  policy_enabled = true
  policy         = data.aws_iam_policy_document.iam-policy.json
}

data "aws_iam_policy_document" "default" {
  statement {
    effect  = "Allow"
    actions = ["sts:AssumeRole"]
    principals {
      type        = "Service"
      identifiers = ["ec2.amazonaws.com"]
    }
  }
}

data "aws_iam_policy_document" "iam-policy" {
  statement {
    actions = [
      "ssm:UpdateInstanceInformation",
      "ssmmessages:CreateControlChannel",
      "ssmmessages:CreateDataChannel",
      "ssmmessages:OpenControlChannel",
    "ssmmessages:OpenDataChannel"]
    effect    = "Allow"
    resources = ["*"]
  }
  statement {
    actions = [
    "kms:CreateGrant"]
    effect    = "Allow"
    resources = [module.kms.key_arn]
    condition {
      test     = "Bool"
      values   = [true]
      variable = "kms:GrantIsForAWSResource"
    }
  }
}

module "ec2" {
  source  = "clouddrove/ec2/aws"
  version = "0.14.0"

  name        = ""
  environment = var.environment
  label_order = var.label_order

  monitoring                  = false
  assign_eip_address          = true
  associate_public_ip_address = true
  instance_profile_enabled    = true
  ebs_optimized               = false
  ebs_volume_enabled          = true
  encrypted                   = true
  instance_tags               = { "snapshot" = true }

  instance_count = 1
  ami            = "ami-08d658f84a6d84a80"
  instance_type  = "t2.nano"

  tenancy                     = "default"
  vpc_security_group_ids_list = [module.ssh.security_group_ids, module.http-https.security_group_ids]
  subnet_ids                  = var.public_subnet_ids

  iam_instance_profile = module.iam-role.name
  disk_size            = 20

  ebs_volume_type = "gp2"
  ebs_volume_size = 30
  kms_key_id      = module.kms.key_arn

  dns_zone_id = "Z1XJD7SSBKXLC1"
  hostname    = "ec2"
}
