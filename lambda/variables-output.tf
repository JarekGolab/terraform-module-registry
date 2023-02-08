output "account_id" {
  value = data.aws_caller_identity.current.account_id
}

output "user_id" {
  value = data.aws_caller_identity.current.user_id
}
output "lambda_arn" {
  value = aws_lambda_function.lambda.arn
}

output "lambda_function_name" {
  value = aws_lambda_function.lambda.function_name
}

output "lambda_function" {
  value = aws_lambda_function.lambda
}
