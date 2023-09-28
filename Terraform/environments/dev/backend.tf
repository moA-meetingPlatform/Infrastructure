# backend.tf

terraform {
  backend "gcs" {
    bucket = "moa-meetingplatform"
    prefix = "terraform/state"
  }
}
