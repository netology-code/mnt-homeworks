
variable "vm_name" {
  type        = string
  default     = "ubuntu-2004-lts"
  description = "name system"
}

variable "vm_web_instance_platform_id" {
  type        = string
  default     = "standard-v1"
  description = "Platform ID"
}

variable "vm_web_resources" {
  type = map(any)
  default = {
    "cores"         = 2
    "memory"        = 1
    "core_fraction" = 5
  }
  description = "web_resources"
}

variable "vm_web_instance_scheduling_policy" {
  type        = bool
  default     = true
  description = "Scheduling policy"
}

variable "vm_web_instance_network_interface_nat" {
  type        = bool
  default     = true
  description = "Interface NAT"
}

variable "vm_db_instance_platform_id" {
  type        = string
  default     = "standard-v1"
  description = "Platform ID"
}

variable "vm_db_resources" {
  type        = map
  default = {
    "cores"        = 2
    "memory"        = 2
    "core_fraction" = 20
  }
  description = "web_resources"
}

variable "vm_db_instance_scheduling_policy" {
  type        = bool
  default     = true
  description = "Scheduling policy"
}

variable "vm_db_instance_network_interface_nat" {
  type        = bool
  default     = true
  description = "Interface NAT"
}

variable "vm_metadata" {
  type = map(any)
  default = {
    "serial-port-enable" = 1
  }
  description = "vm_metadata"
}

variable "forwarded_settings_one" {
  description = "Your Template name - Will be cloned from this template"
  type = list(object({
    vm_name=string, 
    cpu=number, 
    ram=number,
    core_fraction=number, 
    disk=number
  }))
  default = [{
    vm_name="01", 
    cpu=2, 
    ram=4, 
    disk=15,
    core_fraction=5
  }]
}

variable "forwarded_settings_two" {
  description = "Your Template name - Will be cloned from this template"
  type = list(object({
    vm_name=string, 
    cpu=number, 
    ram=number,
    core_fraction=number, 
    disk=number
  }))
  default = [{
    vm_name="02", 
    cpu=4, 
    ram=6, 
    disk=25,
    core_fraction=20
  }]
}

variable "count_disk_size" {
  type        = number
  default     = 1
  description = "Size hdd count"
}
//////////////////////////////
/////lighthouse//////////////
//////////////////////////////
variable "vm_l_instance_platform_id" {
  type        = string
  default     = "standard-v1"
  description = "Platform ID"
}

variable "vm_l_resources" {
  type        = map
  default = {
    "cores"        = 2
    "memory"        = 2
    "core_fraction" = 20
  }
  description = "web_resources"
}

variable "vm_l_instance_scheduling_policy" {
  type        = bool
  default     = true
  description = "Scheduling policy"
}

variable "vm_l_instance_network_interface_nat" {
  type        = bool
  default     = true
  description = "Interface NAT"
}

# variable "vm_metadata" {
#   type = map(any)
#   default = {
#     "serial-port-enable" = 1
#   }
#   description = "vm_metadata"
# }

variable "forwarded_settings_l_one" {
  description = "Your Template name - Will be cloned from this template"
  type = list(object({
    vm_name=string, 
    cpu=number, 
    ram=number,
    core_fraction=number, 
    disk=number
  }))
  default = [{
    vm_name="01", 
    cpu=2, 
    ram=4, 
    disk=15,
    core_fraction=5
  }]
}

variable "forwarded_settings_l_two" {
  description = "Your Template name - Will be cloned from this template"
  type = list(object({
    vm_name=string, 
    cpu=number, 
    ram=number,
    core_fraction=number, 
    disk=number
  }))
  default = [{
    vm_name="02", 
    cpu=4, 
    ram=6, 
    disk=25,
    core_fraction=20
  }]
}

# variable "count_disk_size" {
#   type        = number
#   default     = 1
#   description = "Size hdd count"
# }