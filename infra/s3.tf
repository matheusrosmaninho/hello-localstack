resource "aws_s3_bucket" "infra_bucket_teste" {
  bucket = "bucket-infra-teste"

  tags = {
    Type = "S3"
  }
}

resource "aws_s3_bucket_versioning" "infra_bucket_teste_versioning" {
  bucket = aws_s3_bucket.infra_bucket_teste.id
  versioning_configuration {
    status = "Enabled"
  }

  depends_on = [
    aws_s3_bucket.infra_bucket_teste
  ]
}

resource "aws_s3_bucket_server_side_encryption_configuration" "infra_bucket_teste_sse" {
  bucket = aws_s3_bucket.infra_bucket_teste.id
  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }

  depends_on = [
    aws_s3_bucket.infra_bucket_teste
  ]
}

resource "aws_s3_bucket_lifecycle_configuration" "infra_bucket_teste_lifecycle" {
  bucket = aws_s3_bucket.infra_bucket_teste.id

  rule {
    id = "expire-objects-and-delete-markers"
    filter {
      prefix = "unutilized_rem_files/"
    }
    expiration {
      days = 90
      expired_object_delete_marker = true
    }

    status = "Enabled"
  }

  depends_on = [ aws_s3_bucket.infra_bucket_teste ]
}