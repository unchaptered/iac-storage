# [Provider]
variable "profile" {
  type        = string
  description = "aws configuration profile name"
}

variable "region" {
  type        = string
  description = "aws configuration region name"
}


# [Structure]
variable "prefix" {
  type        = string
  description = <<-DESCRIPTION
  Generally, prefix contains "service" and "stage"

  - service must be 2~5, for example : "kevin"
  - stage must be 2~5, for example : ["prod", "dev", "stage", "test"]
  - prefix for examples : ["kevin-prod", "kevin-dev", "kevin-stage", "kevin-test"]
  DESCRIPTION

  validation {
    condition     = can(regex("^[a-z\\-]{4,11}$", var.prefix))
    error_message = "var.prefix must be 10 with lowercase eng"
  }
}

variable "suffix" {
  type        = string
  description = <<-DESCRIPTION
  Generally, suffix contains "region_name"

  - regaion_name
  - Best : "ap-ne-2"
  - Worst : "ap-northeast-2"
  DESCRIPTION

  validation {
    condition     = can(regex("^[a-z0-9\\-]{4,71}$", var.suffix))
    error_message = "var.suffix must be 10 with lowercase eng"
  }
}

# [Resources]
variable "bucket_name" { type = string }
variable "cf_dist_aliases" { type = list(string) }
variable "cf_dist_certificate_arn" { type = string }

variable "bucket_tags" { type = map(any) }
variable "cf_dist_tags" { type = map(any) }

