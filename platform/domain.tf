resource "aws_api_gateway_domain_name" "breeze" {
    domain_name              = aws_acm_certificate.breeze.domain_name
    regional_certificate_arn = aws_acm_certificate.breeze.arn

    endpoint_configuration {
        types = ["REGIONAL"]
    }
}

resource "aws_api_gateway_base_path_mapping" "breeze" {
    api_id      = aws_api_gateway_rest_api.breeze.id
    domain_name = aws_api_gateway_domain_name.breeze.domain_name
    stage_name  = aws_api_gateway_stage.breeze.stage_name
}