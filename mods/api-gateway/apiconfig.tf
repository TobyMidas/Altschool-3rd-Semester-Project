resource "aws_api_gateway_rest_api" "api" {
  name        = "static-site-api"
  description = "API designed for managing interactions with a static site."
}
