module "detect_root_user_activity" {
  source           = "git::https://github.com/cloudmitigator/reflex-engine.git//modules/cwe_sns_email?ref=v0.2.0"
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

  target_id  = "DetectRootUserActivity"
  sns_topic_arn = var.sns_topic_arn
}
