//Output After Run
output "vpc_arn" {
  description = "VPN ARN"
  value       = aws_vpc.main.arn
  sensitive   = true
}

output "vpc_id" {
  description = "VPN id"
  value       = aws_vpc.main.id
}

output "subnet_id" {
  description = "Subnet ARN"
  value       = aws_subnet.main.id
}

output "ips" {
  description = "VM private IP"
  value = {
    for instance in aws_instance.ec2-be :
    instance.tags.name => instance.private_ip
  }
}

output "bucket_arn" {
  description = "ARN of the bucket"
  value       = aws_s3_bucket.s3_bucket.arn
}

output "bucket_name" {
  description = "Name (id) of the bucket"
  value       = aws_s3_bucket.s3_bucket.id
}

output "bucket_domain" {
  description = "Domain name of the bucket"
  value       = aws_s3_bucket_website_configuration.s3_bucket.website_domain
}
