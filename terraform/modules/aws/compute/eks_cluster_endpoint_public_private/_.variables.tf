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

# [Resource]
variable "eks_cluster_params" {
  type = object({
    name                = string
    subnet_ids          = list(string)
    security_group_ids  = list(string)
    public_access_cidrs = list(string)
  })
}