# VPC 모듈의 variables.tf

# GCP 프로젝트 ID
variable "gcp_project_id" {
  description = "The ID of the GCP project"
  type        = string
}

# GCP 기본 리전
variable "gcp_default_region" {
  description = "The default region for GCP resources"
  type        = string
}
