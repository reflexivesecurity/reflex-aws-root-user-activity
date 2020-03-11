module "detect_root_user_activity" {
  source           = "git::https://github.com/cloudmitigator/reflex-engine.git//modules/cwe_lambda?ref=v0.5.2"
  rule_name        = "DetectRootUserActivity"
  rule_description = "Rule to check when the root user performs any actions"

  event_pattern = <<PATTERN
{
  "detail-type": [
    "AWS API Call via CloudTrail",
    "AWS Console Sign In via CloudTrail"
  ],
  "detail": {
    "userIdentity": {
      "type": ["Root"]
    }
  }
}
PATTERN

  function_name   = "DetectRootUserActivity"
  source_code_dir = "${path.module}/source"
  handler         = "root_user_activity.lambda_handler"
  lambda_runtime  = "python3.7"
  environment_variable_map = {
    SNS_TOPIC = var.sns_topic_arn
  }

  queue_name    = "DetectRootUserActivity"
  delay_seconds = 60

  target_id  = "DetectRootUserActivity"

  sns_topic_arn  = var.sns_topic_arn
  sqs_kms_key_id = var.reflex_kms_key_id
}
