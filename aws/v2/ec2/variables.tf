//Define Valid Variables
variable "vpc_id" {
  type = string
}

variable "subnet_id" {
  type = string
}

variable "instance_ami" {
  type = string
}

variable "instance_type" {
  type = string
}

variable "instance_count" {
  type = number
}

variable "instance_owner" {
  type = string
}
