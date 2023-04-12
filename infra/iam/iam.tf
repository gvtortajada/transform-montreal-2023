variable "project_id" {}
variable "project_number" {}

resource "google_project_organization_policy" "allowedPolicyMemberDomains" {
    project     = var.project_id
    constraint = "iam.allowedPolicyMemberDomains"
 
    list_policy {
        allow {
            all = true
        }
    }
}


resource "google_project_iam_binding" "cloudbuild_loggingServiceAgent" {
  project = var.project_id
  role    = "roles/cloudbuild.loggingServiceAgent"

  members = [
    "serviceAccount:${var.project_number}-compute@developer.gserviceaccount.com",
  ]
}

resource "google_project_iam_binding" "clouddeploy_jobRunner" {
  project = var.project_id
  role    = "roles/clouddeploy.jobRunner"

  members = [
    "serviceAccount:${var.project_number}-compute@developer.gserviceaccount.com",
  ]
}

resource "google_project_iam_binding" "run_developer" {
  project = var.project_id
  role    = "roles/run.developer"

  members = [
    "serviceAccount:${var.project_number}-compute@developer.gserviceaccount.com",
  ]
}

resource "google_project_iam_binding" "clouddeploy_operator" {
  project = var.project_id
  role    = "roles/clouddeploy.operator"

  members = [
    "serviceAccount:${var.project_number}@cloudbuild.gserviceaccount.com",
  ]
}

resource "google_project_iam_binding" "sa-actas" {
  project = var.project_id
  role    = "roles/iam.serviceAccountUser"
  members = [
    "serviceAccount:${var.project_number}@cloudbuild.gserviceaccount.com",
    "serviceAccount:${var.project_number}-compute@developer.gserviceaccount.com"
  ]
}
