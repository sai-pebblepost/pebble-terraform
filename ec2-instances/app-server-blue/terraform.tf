terraform {
    backend "s3" {
    bucket         = "pebble-terraform-tf-state"
    key            = "pebble/flaskapp/blue/qa/terraform.tfstate"
    region         = "us-east-1"
  }
 }
