resource "aws_iam_policy" "s3_policy" {
  name        = "s3_policy"
  description = "IAM policy for S3 bucket access"

  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Effect   = "Allow",
        Action   = "s3:GetObject",
        Resource = "arn:aws:s3:::${var.s3_bucket_id}/*"
      }
    ]
  })
}
