terraform {
    required_version = ">=0.12"
    required_providers {
        aws = {
            source  = "hashicorp/aws"
            version = "~> 3.0"
        }
    }
}

provider "aws" {
    profile = "breeze-project"
    region  = "ap-northeast-1"
}