data "aws_caller_identity" "current" {}

variable "bucket_name" {}

variable "filter_prefix" {
  default = "upload/"
}
variable "filter_suffix" {
  default = ".jpg"
}
variable "lambda_function_arn" {}
variable "lambda_function" {}
variable "lambda_function_name" {}
