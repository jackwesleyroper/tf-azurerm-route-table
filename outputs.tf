output "route_table_id" {
  value       = azurerm_route_table.route_table.id
  description = "The ID of the Route Table."
}

output "route_table_name" {
  value       = azurerm_route_table.route_table.name
  description = "The name of the Route Table."
}

output "route_ids" {
  value       = [for route in azurerm_route.route : route.id]
  description = "A list of Route ID."
}
