//rola
data "aws_iam_policy_document" "assume_role_policy" {
  statement {
    actions = [
      "sts:AssumeRole",
    ]
    principals {
      type = "Service"
      identifiers = [
        "lambda.amazonaws.com",
      ]
    }
    principals {
      type = "AWS"
      identifiers = [
        data.aws_caller_identity.current.arn,
      ]
    }
  }
}


resource "aws_iam_role" "lambda" {
  name               = "Lambda-${var.name}"
  assume_role_policy = data.aws_iam_policy_document.assume_role_policy.json
}

//polityka
data "aws_iam_policy_document" "lambda" {
  statement {
    actions = [
      "s3:Get*",
      "s3:Put*",
    ]
    resources = [
      "${var.bucker_arn}/*",
    ]
  }
}

resource "aws_iam_role_policy" "lambda" {
  name   = var.lambda_policy_name
  role   = aws_iam_role.lambda.name
  policy = data.aws_iam_policy_document.lambda.json
}
