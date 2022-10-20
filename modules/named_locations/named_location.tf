resource "azuread_named_location" "named_location" {
  display_name = var.name

  dynamic "country" {
    for_each = try(var.country, null) != null ? [var.country]: []
    content {
      countries_and_regions = try(country.value.countries_and_regions, [])
      include_unknown_countries_and_regions = try(country.value.include_unknown_countries_and_regions, false)
    }
  }

  dynamic "ip" {
    for_each = try(var.ip, null) != null ? [var.ip]: []
    content {
      ip_ranges = try(ip.value.ip_ranges, [])
      trusted = try(ip.value.trusted, false)
    }
  }
}
