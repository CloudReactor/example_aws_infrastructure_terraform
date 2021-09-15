terraform {
  required_version = "1.0.6"
}

terraform {
    backend "s3" {
      encrypt = true
      region = "us-east-1"
      bucket = "example-projects-terraform-remote-state"
      key = "example-projects.tfstate"
    }
}
