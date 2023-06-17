### Digital Ocean ###
terraform {
  required_providers {
    digitalocean = {
      source  = "digitalocean/digitalocean"
      version = "2.28.1"
    }
    aws = {
      source = "hashicorp/aws"
      version = "5.4.0"
    }
    google = {
      source = "hashicorp/google"
      version = "4.69.1"
    }
  }
}

provider "digitalocean" {
  alias = "do"
  token = var.do_token
}

### AWS ###
provider "aws" {
  alias      = "amazon"
  region     = "us-east-1"
  access_key = var.aws_access_key
  secret_key = var.aws_secret_key
}

### GCP ###
provider "google" {
  alias       = "gcp"
  credentials = "key.json"
  region      = "us-central1"
  zone        = "us-central1-a"
  project     = "terraform-2023"
}