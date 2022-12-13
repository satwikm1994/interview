# Terragrunt will copy the Terraform configurations specified by the source parameter, along with any files in the
# working directory, into a temporary folder, and execute your Terraform commands in that folder.
terraform {
  source = "git::https://gitlab.idfy.com/code/infra/terraform-modules-aws.git//route53?ref=master_v2"
}

# These are the variables we have to pass in to use the module specified in the terragrunt configuration above
# KMS variables

locals {
  myvars        = read_terragrunt_config(find_in_parent_folders("terragrunt.hcl"))
  universe_name = local.myvars.locals.universe_name
}
inputs = {
  vpc_name_list = ["norma-vpc"]
  aws_route53_zone_name = "${local.universe_name}.idfy.internal"
  create                = true
  records = [
    {
      name    = "rmq"
      type    = "A"
      records = ["10.70.199.46", "10.70.198.210", "10.70.200.28"]
      ttl     = 3600
    },
    {
      name    = "redis-1"
      type    = "CNAME"
      records = ["${local.universe_name}-redis-1-replication-group.j4p3ei.ng.0001.apse3.cache.amazonaws.com"]
      ttl     = 600
    },
    {
      name     = "agent-frontend-video-kyc-int-svc",
      type     = "CNAME"
      records = ["internal-a5583980bc89b49ccb327ec29a05e778-1171906675.ap-southeast-3.elb.amazonaws.com"]
      ttl      = 600
    },
    {
      name    = "assignments-service-int-svc",
      type    = "CNAME"
      records = ["internal-a421ac9c99fb84d3cb5d710a71534294-1235988697.ap-southeast-3.elb.amazonaws.com"]
      ttl     = 600
    },
    {
      name    = "profiles-gateway-capture-service-int-svc",
      type    = "CNAME"
      records = ["internal-a82ac1fc768e04d7e9153ff2e156dec0-693617012.ap-southeast-3.elb.amazonaws.com"]
      ttl     = 600
    },
    {
      name    = "profiles-gateway-dashboard-service-int-svc",
      type    = "CNAME"
      records = ["internal-a1221bc88104640bf9b593395cdcb69c-637760606.ap-southeast-3.elb.amazonaws.com"]
      ttl     = 600
    },
    {
      name    = "js-logger-int-svc",
      type    = "CNAME"
      records = ["internal-ab51644761ffa4634b00abf0431e5ed0-238022029.ap-southeast-3.elb.amazonaws.com"]
      ttl     = 600
    },
    {
      name    = "profiles-gateway-service-int-svc",
      type    = "CNAME"
      records = ["internal-aac899613740f4b6bb5bba18552fac83-1698251573.ap-southeast-3.elb.amazonaws.com"]
      ttl     = 600
    },
    {
      name     = "pg-pii-purge-int-svc",
      type     = "CNAME"
      records = ["internal-aecee82f8639d410786c2db2d5dfa8f3-1476254983.ap-southeast-3.elb.amazonaws.com"]
      ttl      = 600
    },
    {
      name     = "pg-pii-store-int-svc",
      type     = "CNAME"
      records = ["internal-a881df5f60a1d488aa2f85888f272d97-559025384.ap-southeast-3.elb.amazonaws.com"]
      ttl      = 600
    },
    {
      name     = "ms-connection-check-int-svc",
      type     = "CNAME"
      records = ["internal-ae9d964e2b1da4921906e91470e2b390-1306951091.ap-southeast-3.elb.amazonaws.com"]
      ttl      = 600
    },
    {
      name    = "operator-handler-int-svc",
      type    = "CNAME"
      records = ["internal-aa01b77f5273449dbaf7d51269a56747-1861512684.ap-southeast-3.elb.amazonaws.com"]
      ttl     = 600
    },
    {
      name    = "work-assign-int-svc",
      type    = "CNAME"
      records = ["internal-aec0b2f3482534df9a95ef584b6a199b-2085093632.ap-southeast-3.elb.amazonaws.com"]
      ttl     = 600
    },
    {
      name    = "work-handler-int-svc",
      type    = "CNAME"
      records = ["internal-a771e51fc4e404048b6f3da580b6e6ed-1347643371.ap-southeast-3.elb.amazonaws.com"]
      ttl     = 600
    },
    {
      name    = "work-monitor-int-svc",
      type    = "CNAME"
      records = ["internal-ae0302ecebf52457981895d2961bed34-1139837792.ap-southeast-3.elb.amazonaws.com"]
      ttl     = 600
    },
    {
      name    = "mjr-retrigger-int-svc",
      type    = "CNAME"
      records = ["internal-ac8982b69b1744b9cbd1282d9a43406c-1336227212.ap-southeast-3.elb.amazonaws.com"]
      ttl     = 600
    },
    {
      name    = "ms-controller-int-svc",
      type    = "CNAME"
      records = ["internal-a8bd0a054c7c743b2a85e836cd27ea3c-953575654.ap-southeast-3.elb.amazonaws.com"]
      ttl     = 600
    },
    {
      name    = "janus-event-handler-int-svc",
      type    = "CNAME"
      records = ["internal-a01e41be65d6f4d1086b59f0ff5bd905-220694059.ap-southeast-3.elb.amazonaws.com"]
      ttl     = 600
    },
    {
      name     = "scheduling-backend-int-svc",
      type     = "CNAME"
      records = ["internal-abaa31c15cf75484a98f5095ae744e9a-982377733.ap-southeast-3.elb.amazonaws.com"]
      ttl      = 600
    },
    {
      name     = "agent-frontend-video-kyc-v2-int-svc",
      type     = "CNAME"
      records = ["internal-a4e059e1d37bd44e28c96d90aa43160f-669204896.ap-southeast-3.elb.amazonaws.com"]
      ttl      = 600
    }
  ]
}


# Include all settings from the root terragrunt.hcl file
include {
  path = find_in_parent_folders()
}
