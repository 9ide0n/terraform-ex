# By derafult all users we create have no access at all, so we need to add one or more policies to them
# This data-source equivalent to this json and parsed to json 
# {
# "Statement": [
#         {
#             "Effect": "Allow",
#             "Action": ["ec2:Describe*"],
#             "Resource": ["*"]
#         }
#     ]
# }
data "aws_iam_policy_document" "ec2_read_only" {
    statement {
        effect = "Allow"
        actions = ["ec2:Describe*"]
        resources = ["*"]
    }
}