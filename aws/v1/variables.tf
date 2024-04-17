//Define Valid Variables
variable "extra" {
  type    = string
  default = "I am from the git repo."
}

variable "extra1" {
  type    = string
  default = "I am from the git repo."
}

variable "instance_type" {
  type = string
}

variable "bucket_name" {
  description = "Name of the s3 bucket. Must be unique."
  type        = string
}

variable "tags" {
  description = "Tags to set on the bucket."
  type        = map(string)
  default     = {}
}
