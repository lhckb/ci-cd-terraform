terraform {
  backend "s3" {
    bucket       = "lhcc-leam-bucket"
    key          = "terraform.tfstate"
    region       = "us-east-1"
    use_lockfile = true
  }
}