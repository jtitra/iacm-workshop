// Define the resources to create
// Provisions the following into AWS: 
//    VCP, Subnet, EC2 Instance, S3 Bucket
resource "aws_vpc" "main" {
  cidr_block       = "10.0.0.0/16"
  instance_tenancy = "default"

  tags = {
    Name = "main"
  }
}


resource "aws_subnet" "main" {
  vpc_id     = aws_vpc.main.id
  cidr_block = "10.0.1.0/24"
  tags = {
    Name = "main"
  }
}

resource "aws_instance" "ec2-be" {
  instance_type = var.instance_type
  ami           = "ami-830c94e3"
  count         = 3
  # ami = "ami-0305d0b03812a425e"

  subnet_id = "subnet-0aaaa2ce2b0237ba8"
  tags = {
    name  = "ec2-be-${count.index}"
    extra = var.extra
  }
}

resource "aws_s3_bucket" "s3_bucket" {
  bucket_prefix = var.bucket_name
  tags          = var.tags
}

resource "aws_s3_bucket_website_configuration" "s3_bucket" {
  bucket = aws_s3_bucket.s3_bucket.id

  index_document {
    suffix = "index.html"
  }

  error_document {
    key = "error.html"
  }
}