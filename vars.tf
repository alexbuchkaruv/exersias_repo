variable "AMIS" {
  description = "A map of AWS region to AMI ID"
  type        = map(string)
  default = {
    us-east-1    = "ami-0c55b159cbfafe1f0"
    us-west-2    = "ami-0bdb828fd58c52235"
    eu-central-1 = "ami-00cf59bc9978eb266"
  }
}

variable "REGION" {
  description = "The AWS region to deploy into"
  type        = string
  default     = "eu-central-1"
}

variable "ZONE1" {
  description = "The availability zone"
  type        = string
  default     = "eu-central-1a"
}

variable "USER" {
  description = "The SSH user"
  type        = string
  default     = "ec2-user"
}

