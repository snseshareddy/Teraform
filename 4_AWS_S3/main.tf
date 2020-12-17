provider "aws" {
  profile = "terraform"
  region  = "us-east-1"
}

resource "aws_s3_bucket" "TF_S3_bucket" {
  bucket = "tf_s3_20201207"
  acl    = "private"
}
