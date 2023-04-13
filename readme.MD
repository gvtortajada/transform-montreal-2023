# infra setup

```
cd infra
./init.sh your_project_id the_region
terraform plan -var 'project_id=your_project_id'
terraform apply -var 'project_id=your_project_id' -auto-approve

```

# Cloud Build

Integrate Cloud Build to your git repo using cloudbuild.yaml as Cloud Build configuration file (yaml or json)

Run the trigger