terraform {
  source = "git::git@github.com:Lsuwito/terraform-module.git//service_iam_role?ref=v0.0.1"
}

include {
  path = find_in_parent_folders()
}

inputs = {
  role_name = "event-service"
  aws_services = ["lambda.amazonaws.com"]
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
