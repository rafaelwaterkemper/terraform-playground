# Project to execute some terraform tests

---
## Rotating AWS Access Keys


Executing `terraform state list` will return the resources that are being managed by the terraform (are on the remote state)
```
    module.iam-rotation-key.aws_iam_access_key.access_key
    module.iam-rotation-key.aws_iam_user.sesuser
    module.iam-rotation-key.aws_ssm_parameter.ses_access_key
```

The `terraform state rm module.iam-rotation-key.aws_iam_access_key.access_key` will dettach the resource being specified from the remote state, so after it, the terraform won't care about that resource, and on the next apply, that resource will be recreated. The [rm](https://developer.hashicorp.com/terraform/cli/commands/state/rm) is different than the [taint](https://developer.hashicorp.com/terraform/cli/commands/taint) option because the taint will mark the resource to be replaced on the next time, but there're some times like during a key rotation where we just want to keep the old value for some time instead remove that.