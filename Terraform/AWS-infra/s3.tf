resource "aws_s3_bucket" "example" {
  bucket = "${var.env}-${var.bucketName}"

  tags = {
    Name        = "${var.env}-s3-bucket-223"
    Environment = var.env
  }
}