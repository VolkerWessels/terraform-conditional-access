
variable "name" {
  description = "The friendly name for this Conditional Access Policy"
  type = string
  validation {
    condition = can(regex("^[[:digit:]]+-[[:ascii:]]{5,}$", var.name))
    error_message = "Name not according to naming convention"
  }
}

variable "state" {
  description = "Specifies the state of the policy object. Possible values are: enabled, disabled and enabledForReportingButNotEnforced"
  type = string
  default = "enabledForReportingButNotEnforced"
  validation {
    condition = contains(["enabled", "disabled", "enabledForReportingButNotEnforced"], var.state)
    error_message = "The possible values for state are:\"enabled\", \"disabled\" or \"enabledForReportingButNotEnforced\""
  }
}

variable "session_controls" {
  description = "A session_controls block as documented below, which specifies the session controls that are enforced after sign-in."
  default = {}
}

variable "grant_controls" {}

variable "conditions" {
  default = {
    client_app_types = ["all"]
    sign_in_risk_levels = []
    user_risk_levels = []
    applications = {
      excluded_applications = []
      included_applications = []
      included_user_actions = null
    }
    locations = {
      excluded_locations      = []
      excluded_location_keys  = null
      included_locations      = []
      included_location_keys  = null
    }
    devices = null
    users = {
      excluded_groups = []
      excluded_roles  = []
      excluded_users  = []
      included_groups = []
      included_roles  = []
      included_users  = []
     }
    platforms = {
      excluded_platforms = []
      included_platforms = []
    }
  }
  type = object({
    client_app_types = list(string)
    sign_in_risk_levels = list(string)
    user_risk_levels = list(string)
    applications = any
    devices = optional(object({
      filter = optional(object({
        mode = string
        rule = string
      }))
    }))
    locations = object({
      excluded_locations      = list(string)
      excluded_location_keys  = optional(list(string))
      included_locations      = list(string)
      included_location_keys  = optional(list(string))
    })
    users = object({
      excluded_groups = list(string)
      excluded_roles  = list(string)
      excluded_users  = list(string)
      included_groups = list(string)
      included_roles  = list(string)
      included_users  = list(string)
    })
    platforms = object({
      excluded_platforms = list(string)
      included_platforms = list(string)
    })

  })
}

variable "named_locations" {
  default = []
}
