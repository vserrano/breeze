resource "tls_private_key" "breeze" {
    algorithm = "RSA"
}

resource "tls_self_signed_cert" "breeze" {
    allowed_uses = [
        "key_encipherment",
        "digital_signature",
        "server_auth",
    ]
    dns_names       = [var.rest_api_domain_name]
    key_algorithm    = tls_private_key.breeze.algorithm
    private_key_pem = tls_private_key.breeze.private_key_pem
    validity_period_hours = 12

    subject {
        common_name  = var.rest_api_domain_name
        organization = "Breeze Project"
    }
}

resource "aws_acm_certificate" "breeze" {
    certificate_body = tls_self_signed_cert.breeze.cert_pem
    private_key      = tls_private_key.breeze.private_key_pem
}