module "cwe" {
  source      = "git::https://github.com/cloudmitigator/reflex-engine.git//modules/cwe_lambda?ref=v0.6.0"
  name        = "RootUserActivity"
  description = "Rule to check when the root user performs any actions"

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
}
