# reflex-aws-detect-root-user-activity  
A Reflex rule for detecting activity by the account root user.

## Usage
To use this rule either add it to your `reflex.yaml` configuration file:  
```
version: 0.1

providers:
  - aws

measures:
  - reflex-aws-detect-root-user-activity
```

or add it directly to your Terraform:  
```
...

module "reflex-aws-detect-root-user-activity" {
  source           = "github.com/cloudmitigator/reflex-aws-detect-root-user-activity"
  email            = "example@example.com"
}

...
```

## License
This Reflex rule is made available under the MPL 2.0 license. For more information view the [LICENSE](https://github.com/cloudmitigator/reflex-aws-detect-root-user-activity/blob/master/LICENSE) 
