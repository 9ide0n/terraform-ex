# output variables requested from S3 tstate data source
output "vpc_id" {
  value = "${aws_vpc.my_vpc.id}"
}

output "public-subnet-1-id" {
  value = "${aws_subnet.public-1.id}"
}

output "public-subnet-2-id" {
  value = "${aws_subnet.public-2.id}"
}
