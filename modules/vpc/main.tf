# resource "aws_vpc" "main" {
#   cidr_block           = var.vpc_cidr
#   enable_dns_support   = true
#   enable_dns_hostnames = true

#   tags = {
#     Name = "main-vpc"
#   }
# }

# resource "aws_subnet" "public_1" {
#   vpc_id                  = aws_vpc.main.id
#   cidr_block              = "172.31.1.0/24"
#   availability_zone       = "us-east-1a"
#   map_public_ip_on_launch = true

#   tags = {
#     Name = "public-subnet-1"
#   }
# }

# resource "aws_subnet" "public_2" {
#   vpc_id                  = aws_vpc.main.id
#   cidr_block              = "172.31.2.0/24"
#   availability_zone       = "us-east-1b"
#   map_public_ip_on_launch = true

#   tags = {
#     Name = "public-subnet-2"
#   }
# }

# resource "aws_subnet" "private_1" {
#   vpc_id            = aws_vpc.main.id
#   cidr_block        = "172.31.3.0/24"
#   availability_zone = "us-east-1a"

#   tags = {
#     Name = "private-subnet-1"
#   }
# }

# resource "aws_subnet" "private_2" {
#   vpc_id            = aws_vpc.main.id
#   cidr_block        = "172.31.4.0/24"
#   availability_zone = "us-east-1b"

#   tags = {
#     Name = "private-subnet-2"
#   }
# }

# resource "aws_internet_gateway" "igw" {
#   vpc_id = aws_vpc.main.id

#   tags = {
#     Name = "main-igw"
#   }
# }

# resource "aws_route_table" "public" {
#   vpc_id = aws_vpc.main.id

#   route {
#     cidr_block = "0.0.0.0/0"
#     gateway_id = aws_internet_gateway.igw.id
#   }

#   tags = {
#     Name = "public-rt"
#   }
# }

# resource "aws_route_table_association" "public_1" {
#   subnet_id      = aws_subnet.public_1.id
#   route_table_id = aws_route_table.public.id
# }

# resource "aws_route_table_association" "public_2" {
#   subnet_id      = aws_subnet.public_2.id
#   route_table_id = aws_route_table.public.id
# }
