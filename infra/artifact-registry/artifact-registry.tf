variable "project_id" {}
variable "region" {}

resource "google_artifact_registry_repository" "containers-registry" {
  location      = var.region
  repository_id = "containers"
  description   = ""
  format        = "DOCKER"
  project       = var.project_id
}