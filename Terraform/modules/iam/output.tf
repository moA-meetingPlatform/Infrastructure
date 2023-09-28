# IAM 모듈의 output.tf

# 서비스 계정의 이메일 주소를 출력합니다.
output "service_account_email" {
  description = "The email of the created GKE service account."
  value       = google_service_account.gke_service_account.email
}
