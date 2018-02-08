# output variables requested from S3 tstate data source
output "vpc_id" {
  value = "${aws_vpc.my_vpc.id}"
}

output "vpc_public_subnet_id" {
  value = "${aws_subnet.public.id}"
}
