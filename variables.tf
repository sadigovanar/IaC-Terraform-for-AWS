variable "region" {
  description = "AWS region"
  type        = string
  default     = "eu-west-3"
}

variable "project" {
  description = "Project name, used in resource names and tags"
  type        = string
}

variable "environment" {
  description = "Environment name (dev, stage, prod)"
  type        = string
  default     = "dev"
}

variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "public_subnets" {
  description = "Public subnets: CIDR and availability zone"
  type = list(object({
    cidr = string
    az   = string
  }))
  default = [
    { cidr = "10.0.10.0/24", az = "eu-west-3a" },
    { cidr = "10.0.20.0/24", az = "eu-west-3b" },
  ]
}

variable "ssh_allowed_cidrs" {
  description = "CIDRs allowed to reach SSH (22). Keep this to your office/VPN range."
  type        = list(string)

  validation {
    condition     = !contains(var.ssh_allowed_cidrs, "0.0.0.0/0")
    error_message = "SSH must not be open to the whole internet."
  }
}

variable "app_port" {
  description = "Application port exposed publicly"
  type        = number
  default     = 8080
}
