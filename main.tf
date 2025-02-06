/**
  * ## Descriptions
  * 
  * Terraform module for the creation of a Route Table with an option to create multiple Routes.
  *
  */

resource "azurerm_route_table" "route_table" {
  resource_group_name           = var.resource_group_name
  location                      = var.location
  name                          = var.name
  bgp_route_propagation_enabled = var.bgp_route_propagation_enabled
  tags                          = var.tags
}

resource "azurerm_route" "route" {
  for_each               = var.routes
  resource_group_name    = var.resource_group_name
  name                   = each.value.name
  route_table_name       = azurerm_route_table.route_table.name
  address_prefix         = each.value.address_prefix
  next_hop_type          = each.value.next_hop_type
  next_hop_in_ip_address = each.value.next_hop_in_ip_address
}

resource "azurerm_subnet_route_table_association" "subnet_route_table_association" {
  for_each       = toset(var.associated_subnets)
  subnet_id      = var.subnet_id[each.key].subnet_id
  route_table_id = azurerm_route_table.route_table.id
}