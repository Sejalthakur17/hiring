# -----------------------------
# AWS REGION
# -----------------------------

variable "aws_region" {
  description = "AWS region for deployment"
  type        = string
  default     = "ap-south-1"
}

# -----------------------------
# VPC CIDR
# -----------------------------

variable "vpc_cidr" {
  description = "CIDR block for VPC"
  type        = string
  default     = "10.0.0.0/16"
}

# -----------------------------
# PUBLIC SUBNET CIDR
# -----------------------------

variable "public_subnet_cidr" {
  description = "CIDR block for public subnet"
  type        = string
  default     = "10.0.1.0/24"
}

# -----------------------------
# PRIVATE SUBNET CIDR
# -----------------------------

variable "private_subnet_cidr" {
  description = "CIDR block for private subnet"
  type        = string
  default     = "10.0.2.0/24"
}

# -----------------------------
# INSTANCE TYPE
# -----------------------------

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t2.micro"
}

# -----------------------------
# AMI ID
# -----------------------------

variable "ami_id" {
  description = "Ubuntu AMI ID"
  type        = string
  default     = "ami-0f58b397bc5c1f2e8"
}

# -----------------------------
# KEY PAIR NAME
# -----------------------------

variable "key_name" {
  description = "AWS EC2 key pair"
  type        = string
  default     = "alchemyst-key"
}