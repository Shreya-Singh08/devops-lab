output "ecr_repository_url" {
  value = module.ecr.repository_url
}

output "alb_dns_name" {
  value = module.alb.alb_dns_name
}

output "github_actions_role_arn" {
  value = module.oidc.role_arn
}