


module "conditional_access_policies" {
  for_each = local.conditional_access_policies
  source   = "./modules/policies"

  name             = each.key
  state            = each.value.state
  conditions       = each.value.conditions
  grant_controls   = each.value.grant_controls
  session_controls = lookup(each.value, "session_controls", null)

}

output "conditional_access_policies" {
  value = module.conditional_access_policies
}
