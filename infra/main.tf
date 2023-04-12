provider "google" {
}

terraform {
  backend "gcs" {}
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "4.40.0"
    }
  }
}

variable "project_id" {
}

data "google_project" "project" {
  project_id = var.project_id
}

module "apis" {
  source     = "./apis"
  project_id = var.project_id
}

module "iam" {
  source     = "./iam"
  project_id = var.project_id
  project_number = data.google_project.project.number
  depends_on = [
    module.apis
  ]
}

module "artifact-registry" {
  source     = "./artifact-registry"
  project_id = var.project_id
  region     = var.region
  depends_on = [
    module.apis
  ]
}