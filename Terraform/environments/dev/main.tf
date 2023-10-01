# VPC 모듈을 호출하여 VPC 및 서브넷을 생성합니다.
module "vpc" {
  source             = "../../modules/vpc"
  gcp_project_id     = var.gcp_project_id
  gcp_default_region = var.gcp_default_region
}

# IAM 모듈을 호출하여 IAM 권한을 설정합니다.
module "iam" {
  source         = "../../modules/iam"
  gcp_project_id = var.gcp_project_id

}


module "gke" {
  source       = "../../modules/gke"
  cluster_name = "dev-cluster"
  location     = var.gcp_default_region
  network      = module.vpc.vpc_name
  subnetwork   = module.vpc.subnet_name
  node_pools   = var.node_pools

  network_policy = true
}
