export PROJECT_ID=$1
echo $PROJECT_ID
export REGION=$2
echo $REGION
gcloud config set project $PROJECT_ID
gsutil mb -p $PROJECT_ID -l $REGION -b on gs://$PROJECT_ID-terraform-state
terraform init -backend-config="bucket=$PROJECT_ID-terraform-state"