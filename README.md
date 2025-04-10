# s3_read_write_etl_glue_pipeline

# 🚀 Use Terraform to deploy an AWS Glue job that reads from and writes to S3 as part of an automated ETL workflow

This project demonstrates how to use **Terraform** to deploy an **AWS Glue Job** that reads from and writes to **Amazon S3**, forming part of an automated ETL (Extract, Transform, Load) workflow.

---

## 📌 Features

- Automatically creates:
  - Source and Destination S3 Buckets
  - IAM Role with required Glue permissions
  - AWS Glue ETL Job (PySpark script)
  - (Optional) Scheduled Trigger for automation
- Terraform-managed infrastructure for repeatability and version control

---

## 🧰 Prerequisites

- AWS CLI configured with appropriate permissions
- Terraform ≥ 1.0 installed
- Python Glue script uploaded to S3 (or included manually)
- An AWS account with access to AWS Glue and S3

---

## 📁 Project Structure

