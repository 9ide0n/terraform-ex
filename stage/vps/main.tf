provider "aws" {
  region = "${var.region}"
}

resource "aws_vpc" "my_vpc" {
  cidr_block = "10.0.0.0/16"
}

# resource "aws_subnet" "public" {
#   vpc_id                  = "${aws_vpc.my_vpc.id}"
#   cidr_block              = "10.0.1.0/24"
#   # allow instanses to reseive public ip automatically
#   map_public_ip_on_launch = true
# }
data "aws_availability_zones" "all" {}

resource "aws_subnet" "public-1" {

  vpc_id                  = "${aws_vpc.my_vpc.id}"
  availability_zone       = "${data.aws_availability_zones.all.names[0]}"
  cidr_block              = "${lookup(var.subnet_cidrs, "public-0")}"
  map_public_ip_on_launch = true
}

resource "aws_subnet" "public-2" {
  vpc_id                  = "${aws_vpc.my_vpc.id}"
  availability_zone       = "${data.aws_availability_zones.all.names[1]}"
  cidr_block              = "${lookup(var.subnet_cidrs, "public-1")}"
  map_public_ip_on_launch = true
}

# add default gateway for route to internet
resource "aws_internet_gateway" "gw" {
  vpc_id = "${aws_vpc.my_vpc.id}"
}

# add routing table with default route
resource "aws_default_route_table" "default_routing" {
  default_route_table_id = "${aws_vpc.my_vpc.default_route_table_id}"

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_internet_gateway.gw.id}"
  }
}
