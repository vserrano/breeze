resource "aws_s3_bucket" "breeze" {
    bucket = "breeze-game-data"
    acl     = "private"

    tags = {
        Name        = "breeze-game-data"
        Environment = "Prod"
        Project     = "Breeze"
    }
}