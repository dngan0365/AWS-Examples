terraform {
    required_providers {
        aws = {
            source = "hashcorp/aws"
            version = "5.30.0"
        }
    }
}

resource "aws_s3_bucket" "example" {
}

resource "aws_s3_object" "object" {
    bucket = aws_s3_bucket.default.id
    key = "myfile.txt"
    source = "myfile.txt"
    etag = filemd5("myfile.txt")
}