// Define the resources to create
// Provisions the following into AWS: 
//    EC2 Instance

// EC2 Instance
resource "aws_instance" "ec2" {
  instance_type = var.instance_type
  ami           = var.instance_ami
  count         = var.instance_count

  subnet_id = data.aws_subnet.selected.id
  tags = {
    name  = "ec2-${count.index}"
    owner = var.instance_owner
  }
}
