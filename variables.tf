variable "resource_group_name" {
  type        = string
  description = "The name of the Resource Group in which to create the Route Table."
}

variable "location" {
  type        = string
  description = "Specifies the supported Azure location where the resource exists."
}

variable "name" {
  type        = string
  description = "The name of the Route Table."
}

variable "bgp_route_propagation_enabled" {
  type        = bool
  default     = false
  description = "(Optional) Boolean flag which controls propagation of routes learned by BGP on that route table. Defaults to true"
}

variable "associated_subnets" {
  type        = list(any)
  default     = []
  description = "Collection of Subnet IDs from the Subnet module used to cross references the names of Subnets to associate with their ID."
}

variable "subnet_id" {
  default     = ""
  description = "Collection of Subnet IDs from the Subnet module used to cross references the names of Subnets to associate with their ID."
}

variable "routes" {
  type        = map(any)
  description = "A collection of objects representing routes."
}

variable "tags" {
  type        = map(string)
  description = "A mapping of tags to assign to the resource."
}