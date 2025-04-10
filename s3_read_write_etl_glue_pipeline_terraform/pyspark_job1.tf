resource "aws_glue_job" "glue_job_pyspark" {
  name              = "poc-glue-job-pyspark"
  role_arn          = aws_iam_role.glue_service_role.arn
  description       = "Transfer CSV from source to target bucket using PySpark"
  glue_version      = "4.0"
  worker_type       = "G.1X"
  timeout           = 2880
  max_retries       = 1
  number_of_workers = 2

  command {
    name           = "glueetl"
    python_version = "3"
    # script_location = "s3://${aws_s3_bucket.tutorial_code_bucket.id}/script.py"
    script_location = "s3://${aws_s3_bucket.tutorial-code-bucket.id}/script.py"
  }

  default_arguments = {
    "--enable-auto-scaling"              = "true"
    "--enable-continuous-cloudwatch-log" = "true"
    "--enable-continuous-log-filter"     = "true"
    "--datalake-formats"                 = "delta"
    "--source-path"                      = "s3://${aws_s3_bucket.tutorial-source-data-bucket.id}/"
    "--destination-path"                 = "s3://${aws_s3_bucket.tutorial-target-data-bucket.id}/"
    "--job-name"                         = "poc-glue-job-pyspark"
    "--enable-metrics"                   = "true"
  }
}

output "glue_source_data_path_pyspark" {
  value = "s3://${aws_s3_bucket.tutorial-source-data-bucket.id}/"
}
