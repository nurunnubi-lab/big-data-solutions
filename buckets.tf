# Unique suffix
resource "random_id" "suffix" {
  byte_length = 4
}

# Source Bucket
resource "aws_s3_bucket" "tutorial-source-data-bucket" {
  bucket        = "tutorial-source-data-bucket-${random_id.suffix.hex}"
  force_destroy = true

  tags = {
    Name = "Source Data Bucket"
  }
}

resource "aws_s3_bucket_versioning" "source" {
  bucket = aws_s3_bucket.tutorial-source-data-bucket.id

  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_object" "data-object" {
  bucket = aws_s3_bucket.tutorial-source-data-bucket.bucket
  key    = "organizations.csv"
  source = "${path.module}/data_file/organizations.csv"
}

# Target Bucket
resource "aws_s3_bucket" "tutorial-target-data-bucket" {
  bucket        = "tutorial-target-data-bucket-${random_id.suffix.hex}"
  force_destroy = true

  tags = {
    Name = "Target Data Bucket"
  }
}

# Code Bucket
resource "aws_s3_bucket" "tutorial-code-bucket" {
  bucket        = "tutorial-code-bucket-${random_id.suffix.hex}"
  force_destroy = true

  tags = {
    Name = "Code Bucket"
  }
}

resource "aws_s3_bucket_versioning" "code" {
  bucket = aws_s3_bucket.tutorial-code-bucket.id

  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_object" "code-data-object" {
  bucket = aws_s3_bucket.tutorial-code-bucket.bucket
  key    = "script.py"
  source = "${path.module}/data_file/script.py"
}


