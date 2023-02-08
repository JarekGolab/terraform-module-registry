//bucket
resource "aws_s3_bucket" "bucket" {
  bucket = var.bucket_name

  tags = {
    "Name" = var.bucket_name
  }

}

//spinamy bucket z lambdą

resource "aws_lambda_permission" "lambda" {
  statement_id  = "AllowExecutionFromS3Bucket"
  action        = "lambda:InvokeFunction"
  function_name = var.lambda_function_name
  principal     = "s3.amazonaws.com"
  source_arn    = aws_s3_bucket.bucket.arn
}

resource "aws_s3_bucket_notification" "resizer" {
  bucket = aws_s3_bucket.bucket.id

  lambda_function {
    lambda_function_arn = var.lambda_function_arn
    events = [
      "s3:ObjectCreated:*"
    ]
    filter_prefix = var.filter_prefix
    filter_suffix = var.filter_suffix
  }

  depends_on = [
    var.lambda_function
  ]

}
