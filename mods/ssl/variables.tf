variable "domain" {
  description = "The domain name for which the SSL certificate will be requested and validated."
  type        = string
}

variable "zone_id" {
  description = "The Route 53 hosted zone ID where DNS records will be created for certificate validation."
  type        = string
}
