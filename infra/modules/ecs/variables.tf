variable "project" {
  type = string
}

variable "region" {
  type = string
}

variable "vpc_id" {
  type = string
}

variable "public_subnet_ids" {
  type = list(string)
}

variable "ecr_repository_url" {
  type = string
}

variable "target_group_arn" {
  type = string
}

variable "alb_security_group_id" {
  type = string
}