output "curl_domain_url" {
    depends_on = [aws_api_gateway_base_path_mapping.breeze]

    description = "API Gateway Domain URL (self-signed certificate)"
    value       = "curl -H 'Host: ${var.rest_api_domain_name}' https://${aws_api_gateway_domain_name.breeze.regional_domain_name}${var.rest_api_path} # May take a minute to become available after initial deploy."
}

output "curl_stage_invoke_url" {
    description = "API Gateway Stage Invoke URL"
    value       = "curl ${aws_api_gateway_stage.breeze.invoke_url}${var.rest_api_path}"
}