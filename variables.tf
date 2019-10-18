variable "custom_tags" {
  type        = "map"
  default     = {}
  description = "Custom tags that will be applied to every resource"
}


variable "environment_name" {
  type    = "string"
  default = "development"
}
