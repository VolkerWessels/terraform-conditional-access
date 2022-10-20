variable "name" {
  description = "The friendly name for this Named Location"
  type = string
}

variable "country" {
  description = "A country block, which configures a country-based named location"
  default = {}
  type = object({
    countries_and_regions = optional(list(string))
    include_unknown_countries_and_regions = optional(bool)
  })
  validation {
    condition = alltrue([
      for v in try(var.country.countries_and_regions,[]) : can(regex("^[A-Z]{2}$", v))
    ])
    error_message = "The specified list of countries and/or regions should be in uppercase two-letter format"
  }
}

variable "ip" {
  description = "A country block, which configures a country-based named location"
  default = {}
  type = object({
    ip_ranges = optional(list(string))
    trusted = optional(bool)
  })
  validation {
    condition = alltrue([
      for v in try(var.ip.ip_ranges,[]) : can(cidrnetmask(v))
    ])
    error_message = "The specified list of countries and/or regions should be in uppercase two-letter format"
  }
}