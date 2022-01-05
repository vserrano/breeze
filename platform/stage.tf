resource "aws_api_gateway_stage" "breeze" {
    deployment_id = aws_api_gateway_deployment.breeze.id
    rest_api_id = aws_api_gateway_rest_api.breeze.id
    stage_name = "breeze"
}

resource "aws_api_gateway_method_settings" "breeze" {
    rest_api_id = aws_api_gateway_rest_api.breeze.id
    stage_name  = aws_api_gateway_stage.breeze.stage_name
    method_path = "*/*"

    settings {
        metrics_enabled = true
    }
}