variable "project_id" {
}

variable "gcp_service_list" {
  description = "The list of apis necessary for the project"
  type        = list(string)
  default = [
    "artifactregistry.googleapis.com",
    "container.googleapis.com",
    "pubsub.googleapis.com",
    "cloudbuild.googleapis.com",
    "containerscanning.googleapis.com",
    "clouddeploy.googleapis.com",
    "run.googleapis.com"
  ]
}

resource "google_project_service" "gcp_services" {
  for_each = toset(var.gcp_service_list)
  project  = var.project_id
  service  = each.key
}