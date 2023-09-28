# modules/iam/main.tf

# GKE를 운영하기 위한 서비스 계정을 생성합니다.
resource "google_service_account" "gke_service_account" {
  account_id   = "project-service-account"
  display_name = "GKE Service Account"
  project      = var.gcp_project_id
}


# GKE에 필요한 관리자 권한을 위에서 생성한 서비스 계정에 부여합니다.
resource "google_project_iam_binding" "gke_admin" {
  project = var.gcp_project_id      # GCP 프로젝트 ID를 참조합니다.
  role    = "roles/container.admin" # GKE 관리자 역할을 지정합니다.

  members = [
    "serviceAccount:${google_service_account.gke_service_account.email}" # 위에서 생성한 서비스 계정의 이메일을 멤버로 추가합니다.
  ]
}

# GCP Compute 리소스에 대한 관리자 권한을 위에서 생성한 서비스 계정에 부여합니다.
resource "google_project_iam_binding" "compute_admin" {
  project = var.gcp_project_id    # GCP 프로젝트 ID를 참조합니다.
  role    = "roles/compute.admin" # Compute 관리자 역할을 지정합니다.

  members = [
    "serviceAccount:${google_service_account.gke_service_account.email}" # 위에서 생성한 서비스 계정의 이메일을 멤버로 추가합니다.
  ]
}
