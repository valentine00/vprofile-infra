# vprofile-infra

Terraform configuration for the vprofile infrastructure deployment.

## Overview

This repository contains Terraform manifests for provisioning resources in the vprofile environment.

## Files

- `main.tf` - primary Terraform configuration
- `backend.tf` - Terraform backend configuration
- `variables.tf` - input variable definitions
- `outputs.tf` - output values
- `argocdingress.yml` - Argo CD ingress configuration

## Usage

1. Initialize Terraform
   ```bash
   terraform init
   ```

2. Review the planned changes
   ```bash
   terraform plan
   ```

3. Apply the configuration
   ```bash
   terraform apply
   ```

## Notes

- Do not commit the `.terraform/` directory; it stores local Terraform state and plugin cache.
- Keep `terraform.tfstate` and sensitive values out of version control.
