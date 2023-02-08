data "aws_caller_identity" "current" {}

variable "name" {}
variable "source_dir" {}
variable "handler" {
  default = "index.handler"
}
variable "runtime" {
  default = "nodejs16.x"
}
variable "bucker_arn" {}
variable "lambda_policy_name" {}
