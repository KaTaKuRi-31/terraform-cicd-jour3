terraform {
  backend "s3" {
    bucket = "tf-state-dylan-jour3"
    key    = "jour3/terraform.tfstate"
    region = "eu-west-3"
  }
}
