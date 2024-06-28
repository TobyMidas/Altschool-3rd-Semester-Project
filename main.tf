provider "aws" {
  region = var.aws_region  // Define your AWS region using a variable
}

module "s3_bucket" {
  source      = "./mods/s3bucket"  // Path to S3 module directory
  bucket_name = var.bucket_name  // Define bucket_name using a variable
}

module "certificate" {
  source  = "./mods/ssl"  // Path to ACM certificate module directory
  domain  = var.domain  // Define domain name using a variable
  zone_id = var.route53_zone_id  // Define Route 53 hosted zone ID using a variable
}

module "cloudfront" {
  source          = "./mods/cloudfront"  // Path to CloudFront module directory
  s3_bucket_id    = module.s3_bucket.bucket_id  // Reference S3 bucket ID from s3_bucket module
  certificate_arn = module.certificate.arn  // Reference ACM certificate ARN from certificate module
  domain          = var.domain  // Define domain name using a variable
}

module "route53" {
  source                  = "./mods/route53"  // Path to Route 53 module directory
  domain                  = var.domain  // Define domain name using a variable
  zone_id                 = var.route53_zone_id  // Define Route 53 hosted zone ID using a variable
  cloudfront_domain_name  = module.cloudfront.domain_name  // Reference CloudFront domain name
  cloudfront_zone_id      = module.cloudfront.zone_id  // Reference CloudFront hosted zone ID
}

module "iam" {
  source       = "./mods/iam"  // Path to IAM module directory
  s3_bucket_id = module.s3_bucket.bucket_id  // Reference S3 bucket ID from s3_bucket module
}

module "api_gateway" {
  source = "./mods/api-gateway"  // Path to API Gateway module directory
  // Add any necessary variables for API Gateway module configuration
}
