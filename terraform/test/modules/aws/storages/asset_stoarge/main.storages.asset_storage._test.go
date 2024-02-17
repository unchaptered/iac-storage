package main

import (
	"testing"

	"github.com/gruntwork-io/terratest/modules/terraform"
)

func Test_Terraform_Modules_Aws_Storages_AssetStorage(t *testing.T) {
	tfOptions := terraform.WithDefaultRetryableErrors(t, &terraform.Options{
		TerraformDir: "../../../../../modules/aws/storages/asset_storage",
		VarFiles:     []string{"./sample.tfvars"},
	})

	defer terraform.Destroy(t, tfOptions)

	terraform.Init(t, tfOptions)
}
