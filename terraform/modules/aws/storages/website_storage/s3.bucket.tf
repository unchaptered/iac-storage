module "s3_bucket" {
  source = "../../../../resources/aws/s3/bucket"

  bucket_name = "${var.prefix}-s3-${var.module_name}-${var.suffix}"
  tags        = var.tags
}