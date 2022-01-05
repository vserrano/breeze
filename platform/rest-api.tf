resource "aws_api_gateway_rest_api" "breeze" {
    body = jsonencode({
        openapi = "3.0.1"
        info = {
            tutle = var.rest_api_name
            version = "1.0"
        }
        paths = {
            (var.rest_api_path) = {
                get = {
                    x-amazon-apigateway-integration = {
                        httpMethod = "GET"
                        payloadFormatVersion = "1.0"
                        type = "HTTP_PROXY"
                        uri = "https://ip-ranges.amazonaws.com/ip-ranges.json"
                    }
                }
            }
        }
    })

    name = var.rest_api_name

    endpoint_configuration {
        types = ["REGIONAL"]
    }
}

resource "aws_api_gateway_deployment" "breeze" {
    rest_api_id = aws_api_gateway_rest_api.breeze.id

    triggers = {
        redeployment = sha1(jsonencode(aws_api_gateway_rest_api.breeze.body))
    }

    lifecycle {
        create_before_destroy = true
    }
}