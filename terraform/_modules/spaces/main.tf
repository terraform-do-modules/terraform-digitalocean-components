provider "digitalocean" {}

##------------------------------------------------
## spaces module call
##------------------------------------------------
module "spaces" {
  source      = "terraform-do-modules/spaces/digitalocean"
  version     = "1.0.0"
  name          = "space"
  environment   = "test"
  acl           = "private"
  force_destroy = false
  region        = "nyc3"

  cors_rule = [
    {
      allowed_headers = ["*"]
      allowed_methods = ["PUT", "POST"],
      allowed_origins = ["https://www.example.com"],
      expose_headers  = ["ETag"],
      max_age_seconds = 3000
    }
  ]

  lifecycle_rule = [
    {
      enabled                                = true
      abort_incomplete_multipart_upload_days = 20
      expiration = [
        {
          date                         = "2029-02-28"
          days                         = 85
          expired_object_delete_marker = true
        }
      ]
      noncurrent_version_expiration_days = 15

    }
  ]

  policy = jsonencode({
    "Version" : "2012-10-17",
    "Statement" : [
      {
        "Sid" : "IPAllow",
        "Effect" : "Deny",
        "Principal" : "*",
        "Action" : "s3:*",
        "Resource" : [
          "arn:aws:s3:::spaces-name",
          "arn:aws:s3:::spaces-name/*"
        ],
        "Condition" : {
          "NotIpAddress" : {
            "aws:SourceIp" : "0.0.0.0/0"
          }
        }
      }
    ]
  })
}

