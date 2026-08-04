# DevOps Lab — Cloud-Native App Platform

A containerized Flask app deployed to AWS via Terraform, with full CI/CD automation through GitHub Actions using OIDC (no stored AWS credentials).

## Architecture

VPC (ap-south-1)
                    │
          ┌─────────┴─────────┐
      Public Subnet A     Public Subnet B
                    │
                   ALB
                    │
              ECS Fargate Service
                    │
               Flask container
## Stack

- **App**: Flask, containerized with Docker
- **Infra**: Terraform (modular: network, ecr, alb, ecs, oidc)
- **State**: Remote in S3, locked via DynamoDB
- **Registry**: Amazon ECR
- **Compute**: ECS Fargate
- **Load balancing**: Application Load Balancer
- **CI/CD**: GitHub Actions, authenticated via AWS IAM OIDC (no long-lived keys)

## Repo structure

## Local development

```bash
docker build -t myapp:local ./app
docker run -p 8080:8080 myapp:local
curl localhost:8080/health
```

## Deploying infra changes

Push changes to `infra/**` on `main` — the Terraform workflow plans and applies automatically.

## Deploying app changes

Push changes to `app/**` on `main` — the Build & Deploy workflow builds the image, pushes to ECR, and forces a new ECS deployment.

## Teardown

```bash
cd infra/envs/dev
terraform destroy
```

## What I learned building this

- Setting up remote Terraform state with S3 + DynamoDB locking
- Debugging a GitHub OIDC `sub` claim format mismatch using JWT inspection
- Scoping IAM policies incrementally as Terraform's actual permission needs became clear
- Structuring Terraform into reusable modules with explicit input/output wiring