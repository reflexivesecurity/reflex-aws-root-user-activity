module "sqs_lambda" {
  source                    = "git::https://github.com/cloudmitigator/reflex-engine.git//modules/sqs_lambda?ref=v2.0.1"
  cloudwatch_event_rule_id  = var.cloudwatch_event_rule_id
  cloudwatch_event_rule_arn = var.cloudwatch_event_rule_arn
  function_name             = "RootUserActivity"
  package_location          = var.package_location
  handler                   = "root_user_activity.lambda_handler"
  lambda_runtime            = "python3.7"
  environment_variable_map = {
    SNS_TOPIC = var.sns_topic_arn
  }

  queue_name    = "RootUserActivity"
  delay_seconds = 60

  target_id = "RootUserActivity"

  sns_topic_arn  = var.sns_topic_arn
  sqs_kms_key_id = var.reflex_kms_key_id
}
