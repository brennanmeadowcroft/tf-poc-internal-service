# data "aws_ssm_parameter" "serverless_bucket_name" {
#   name = "${var.APP_NAME}-${var.ENV}-serverless-bucket"
# }

# Get OMDB API Key from parameter store and set in lambda ENV

# Create basic serverless application in provided vpc

# Save API Gateway URL to Parameter Store

# Output API Gateway URL

resource "null_resource" "deployment_script" {
  triggers = {
    always_run = timestamp()
  }

  provisioner "local-exec" {
    command = "source ./bin/build.sh"
    environment = {
      VERSION  = var.VERSION
      APP_NAME = var.APP_NAME
    }
  }
}

module "serverless-api" {
  source           = "github.com/brennanmeadowcroft/tf-poc-modules/serverless-api/"
  APP_NAME         = var.APP_NAME
  ENV              = var.ENV
  ARTIFACT_S3_KEY  = "${var.APP_NAME}/${var.VERSION}.zip"
  PATH_TO_ARTIFACT = "./build/${var.APP_NAME}.zip"
}

output "api_gateway_url" {
  value = module.serverless-api.base_url
}
