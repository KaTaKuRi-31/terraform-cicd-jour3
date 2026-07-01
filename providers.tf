provider "aws" {
  # La région et les credentials sont lus depuis :
  #   AWS_DEFAULT_REGION
  #   AWS_ACCESS_KEY_ID
  #   AWS_SECRET_ACCESS_KEY
  region = var.region
}
