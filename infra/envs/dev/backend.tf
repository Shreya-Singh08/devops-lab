terraform {
  backend "s3" {
    bucket         = "devops-lab-tfstate-shreya08-v2"
    key            = "dev/terraform.tfstate"
    region         = "ap-south-1"
    dynamodb_table = "devops-lab-tf-locks"
    encrypt        = true
  }
}