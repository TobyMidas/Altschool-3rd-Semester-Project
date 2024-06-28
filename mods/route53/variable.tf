variable "zone_id" {
  description = "The ID of the Route 53 hosted zone where the DNS record will be created."
  type        = string
}

variable "domain" {
  description = "The domain name for which the DNS record will be created (e.g., example.com)."
  type        = string
}

variable "cloudfront_domain_name" {
  description = "The domain name of the CloudFront distribution to which the DNS record will alias."
  type        = string
}

variable "cloudfront_zone_id" {
  description = "The hosted zone ID of the CloudFront distribution."
  type        = string
}
