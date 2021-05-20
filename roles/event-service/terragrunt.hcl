terraform {
  source = "git::git@github.com:Lsuwito/terraform-module.git//service-iam-role?ref=v0.0.4"
}

include {
  path = find_in_parent_folders()
}

inputs = {
  role_name = "event-service"
  aws_services = ["lambda.amazonaws.com", "apigateway.amazonaws.com"]
  inline_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": [
        "kinesis:DescribeStream",
        "kinesis:DescribeStreamSummary",
        "kinesis:GetRecords",
        "kinesis:GetShardIterator",
        "kinesis:ListShards",
        "kinesis:ListStreams",
        "kinesis:SubscribeToShard",
        "kinesis:PutRecord",
        "kinesis:PutRecords",
        "logs:CreateLogGroup",
        "logs:CreateLogStream",
        "logs:PutLogEvents"
      ],
      "Resource": "*",
      "Effect": "Allow"
    }
  ]
}
EOF
}
