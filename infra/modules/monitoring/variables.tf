variable "project" {
  type = string
}

variable "alert_email" {
  description = "Email address to receive CloudWatch alarm notifications"
  type        = string
}

variable "ecs_cluster_name" {
  type = string
}

variable "ecs_service_name" {
  type = string
}

variable "alb_arn_suffix" {
  type = string
}

variable "target_group_arn_suffix" {
  type = string
}