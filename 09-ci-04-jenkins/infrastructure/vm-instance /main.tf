variable name { default = "" }
variable description { default = "" }
variable platform { default = "standard-v1" }
variable cpu { default = "" }
variable ram { default = "" }
variable cpu_load { default = 5 }
variable main_disk_image { default = "" }
variable main_disk_size { default = "" }
variable subnet { default = "" }
variable user { default = "" }

terraform {
  required_providers {
    yandex = {
      source = "yandex-cloud/yandex"
    }
  }
  required_version = ">= 0.13"
}

resource "yandex_compute_instance" "vm-instance" {
  name        = var.name
  description = var.description
  platform_id = var.platform

  resources {
    cores         = var.cpu
    memory        = var.ram
    core_fraction = var.cpu_load
  }

  boot_disk {
    device_name = var.user
    initialize_params {
      image_id = var.main_disk_image
      type     = "network-hdd"
      size     = var.main_disk_size
    }
  }

  network_interface {
    subnet_id = var.subnet
    nat       = true
  }

  metadata = {
    ssh-keys = "${var.user}:${file("~/.ssh/id_ed25519.pub")}"
  }
}

output "external_ip" {
  value = "${yandex_compute_instance.vm-instance.network_interface.0.nat_ip_address}"
}
