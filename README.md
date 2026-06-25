# vprofile-infra

Infrastructure as Code for the vprofile EKS cluster and supporting services using Terraform.

## Overview

This repository contains Terraform configurations and deployment files for provisioning and managing the vprofile infrastructure on AWS, including EKS cluster setup, networking, monitoring, and Argo CD integration.

## Project Structure

### Terraform Configuration
- `main.tf` - Primary Terraform configuration for EKS cluster, VPC, subnets, IAM roles, and node groups
- `backend.tf` - S3 backend configuration for remote state management
- `variables.tf` - Input variable definitions
- `outputs.tf` - Output values for cluster information and endpoints

### Kubernetes & Service Configuration
- `argocd_grafana_ingress.yml` - ALB ingress configuration for Argo CD and Grafana
- `monitoringvalues.yaml` - Helm values for monitoring stack deployment

### CI/CD
- `.github/workflows/terraform.yaml` - GitHub Actions workflow for:
  - Terraform validation and planning
  - EKS drift detection (checks code against live cluster)
  - Manual apply with approval
  - Slack notifications on plan completion

## Workflow Features

The GitHub Actions workflow includes:
- **Drift Detection**: Automatically detects differences between Terraform code and live EKS cluster
- **PR Integration**: Posts drift detection alerts to pull requests
- **Manual Apply**: Workflow dispatch allows manual application of detected changes
- **Slack Notifications**: Real-time status updates with drift information and apply links
- **Plan Artifacts**: Terraform plans are uploaded and reused during apply phase

## Usage

### Local Development

1. Initialize Terraform
   ```bash
   terraform init -backend-config="bucket=YOUR_BUCKET_NAME"
   ```

2. Review the planned changes
   ```bash
   terraform plan
   ```

3. Apply the configuration
   ```bash
   terraform apply
   ```

### Automated Deployment

- Push to `main` branch or create a pull request to trigger the workflow
- Review drift detection results in the PR comments
- Use the workflow dispatch link to apply changes manually

## Requirements

- Terraform >= 1.7.0
- AWS credentials configured in GitHub secrets (`AWS_ACCESS_KEY_ID`, `AWS_SECRET_ACCESS_KEY`)
- S3 bucket for Terraform state (`BUCKET_TF_STATE`)
- Slack webhook for notifications (optional)

## Notes

- Do not commit the `.terraform/` directory; it stores local Terraform state and plugin cache
- Keep `terraform.tfstate` and sensitive values out of version control
- State files are stored remotely in S3 with versioning enabled
