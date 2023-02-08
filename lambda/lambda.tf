

//kod lambdy
data "archive_file" "lambda" {
  type        = "zip"
  source_dir  = var.source_dir
  output_path = "tmp/lambda/${var.name}.zip"
}

//lambda
resource "aws_lambda_function" "lambda" {

  filename         = "${path.module}/resizer/lambda.zip"
  function_name    = var.name
  role             = aws_iam_role.lambda.arn
  handler          = var.handler
  runtime          = var.runtime
  source_code_hash = filebase64sha256("${path.module}/resizer/lambda.zip")

}


