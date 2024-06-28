# Variables
variable "bucket_name" {
  description = "The name of the S3 bucket"
  type        = string
  default     = "eberenwoke"  # Replace with a unique bucket name using only lowercase, hyphens, and numbers
}
