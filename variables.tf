variable "aws_region" {
  description = "The AWS region to deploy to"
  default     = "us-east-1"
}

variable "domain" {
  description = "The domain name to use for the website"
}

variable "bucket_name" {
  description = "The name of the S3 bucket"
}

variable "route53_zone_id" {
  description = "Route 53 hosted zone ID"
}