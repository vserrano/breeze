variable "aws_region" {
    default     = "ap-northeast-1"
    description = "AWS Region"
    type        = string
}

variable "rest_api_domain_name" {
    default     = "breeze-project.com"
    description = "Domain name of the API Gateway REST API for self-signed TLS certificate"
    type        = string
}

variable "rest_api_name" {
    default     = "api-gateway-rest-api-openapi-example"
    description = "Name of the API Gateway REST API (can be used to trigger redeployments)"
    type        = string
}

variable "rest_api_path" {
    default     = "/default"
    description = "Path to create the API Gateway REST API (can be used to trigger redeployments)"
    type        = string
}