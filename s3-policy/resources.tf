resource "aws_s3_bucket" "s3_bucket" {
  bucket = "dimitar-manov-s3-001"
}

resource "aws_s3_bucket_policy" "bucket_policy" {
  bucket = aws_s3_bucket.s3_bucket.id
  policy = templatefile("./policy.json", {
    bucket_arn = aws_s3_bucket.s3_bucket.arn
  })
}

resource "aws_s3_bucket_public_access_block" "allow_public" {
  bucket = aws_s3_bucket.s3_bucket.bucket
  block_public_acls = false
  block_public_policy = false
  ignore_public_acls = false
  restrict_public_buckets = false
}