variable "YC_CLOUD_ID" { default = "" }
variable "YC_FOLDER_ID" { default = "" }
variable "YC_ZONE" { default = "" }

terraform {
  required_providers {
    yandex = {
      source = "yandex-cloud/yandex"
    }
  }
  required_version = ">= 0.13"
}

provider "yandex" {
  service_account_key_file = "/home/sa/.ssh/yc-key.json"
  cloud_id  = var.YC_CLOUD_ID
  folder_id = var.YC_FOLDER_ID
  zone      = var.YC_ZONE
}

resource "yandex_compute_image" "centos-7" {
  name          = "centos-7"
  source_family = "centos-7"
}

resource "yandex_compute_instance" "vm" {
  for_each = local.vm_nodes

  name        = "${each.key}"
  description = "Node for ${each.key}"

  platform_id = "standard-v1"

  resources {
    cores         = 2
    memory        = 4
    core_fraction = 5
  }

  boot_disk {
    initialize_params {
      image_id = yandex_compute_image.centos-7.id
      type     = "network-hdd"
      size     = 10
    }
  }

  network_interface {
    subnet_id = "${yandex_vpc_subnet.my-subnet.id}"
    nat       = true
  }

  metadata = {
    ssh-keys = "centos:${file("~/.ssh/id_ed25519.pub")}"
  }
}

resource "yandex_vpc_network" "my-net" {
  name = "vm-network"
}

resource "yandex_vpc_subnet" "my-subnet" {
  name = "cluster-subnet"
  v4_cidr_blocks = ["10.2.0.0/16"]
  zone = var.YC_ZONE
  network_id = yandex_vpc_network.my-net.id
  depends_on = [yandex_vpc_network.my-net]
}

output "sonar_ip" {
  value = yandex_compute_instance.vm["sonar"].network_interface.0.nat_ip_address
}

output "nexus_ip" {
  value = yandex_compute_instance.vm["nexus"].network_interface.0.nat_ip_address
}

locals { 
  vm_nodes = toset(["sonar", "nexus"])
}
