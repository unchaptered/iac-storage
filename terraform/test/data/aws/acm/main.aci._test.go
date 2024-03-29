package main

import (
	"testing"

	"github.com/gruntwork-io/terratest/modules/terraform"
)

func TestTerraformDataAwsAcm(t *testing.T) {
	t.Parallel()

	mockDomainName := "example.com"
	mockStatus := []string{"ISSUED"}
	mockProviderRegion := "us-east-1"

	// 테스트 옵션을 설정합니다.
	options := terraform.WithDefaultRetryableErrors(t, &terraform.Options{
		TerraformDir: "../../../../data/aws/acm",
		Vars: map[string]interface{}{
			"domain": mockDomainName,
			"status": mockStatus,
		},
		EnvVars: map[string]string{
			"AWS_DEFAULT_REGION": mockProviderRegion,
		},
	})

	// C:\Personal\iac-storage\terraform\data\aws\acm
	// C:\Personal\iac-storage\terraform\test\data\aws\acm
	// Terraform 초기화 및 적용
	defer terraform.Destroy(t, options)

	terraform.Init(t, options)

	// terraform.InitAndApply(t, options)

	// Terraform 적용 결과 출력
	// arn := terraform.Output(t, options, "arn")

	// 출력값을 검증합니다.
	// assert.Equal(t, "sadsad", arn)
	// assert.Equal(t, 1, "dd")
}
