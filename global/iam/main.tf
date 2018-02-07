provider "aws" {
    region = "us-east-1"
}

# For cycle ex create 3 users named neo.1, neo.2, neo.3
# resource "aws_iam_user" "example" {
#     count = 3
#     name = "neo.${count.index}"
# }

# create users defined in list var.user_names (3 users actually)
# because of count this resourse return a list of users instead of one
resource "aws_iam_user" "example" {
    count = "${length(var.user_names)}" #loop from 0 to length of the list
    name = "${element(var.user_names, count.index)}" #get name element of list with index 0,1,2
}
#create a policy allow readonly access to anything in EC2, based on json-encapsulated data source
resource "aws_iam_policy" "ec2_read_only" {
    name = "ec2-read-only"
    policy = "${data.aws_iam_policy_document.ec2_read_only.json}"
}
# create 3 policies in loop based on resourse list of iam users created earlier
resource "aws_iam_user_policy_attachment" "ec2_access" {
    count = "${length(var.user_names)}"
    user = "${element(aws_iam_user.example.*.name, count.index)}" # for each name at resource list get name with index=0,1,2
    policy_arn = "${aws_iam_policy.ec2_read_only.arn}"
}