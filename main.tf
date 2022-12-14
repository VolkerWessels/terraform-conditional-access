
module "named_locations" {
  for_each = var.named_locations
  source   = "./modules/named_locations"

  name             = each.value.name
  country          = lookup(each.value,"country", null)
  ip               = lookup(each.value,"ip", null)
}

output "named_locations" {
  value = module.named_locations
}

module "conditional_access_policies" {
  for_each = local.conditional_access_policies
  source   = "./modules/policies"

  name             = try(each.value.name, each.key)
  state            = each.value.state
  conditions       = each.value.conditions
  grant_controls   = lookup(each.value,"grant_controls", null)
  session_controls = lookup(each.value, "session_controls", null)
  named_locations  = try(module.named_locations, [])
}

output "conditional_access_policies" {
  value = module.conditional_access_policies
}
