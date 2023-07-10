resource "yandex_compute_instance" "platform-2" {
    depends_on = [yandex_compute_instance.web]
  for_each = {
    0 = var.forwarded_settings_one[0]
    #1 = var.forwarded_settings_two[0]
  }
    #name = "netology-${local.env}-${local.project}-${local.role.1}-${each.value.vm_name}"
    name = "${local.role.0}-${each.value.vm_name}"
  
  platform_id = var.vm_db_instance_platform_id
  resources {
    cores         = "${each.value.cpu}"
    memory        = "${each.value.ram}"
    core_fraction = "${each.value.core_fraction}"
    
  }
  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.ubuntu.image_id
      size           = "${each.value.disk}"
    }
  }
  scheduling_policy {
    preemptible = var.vm_db_instance_scheduling_policy
  }
  network_interface {
    subnet_id = yandex_vpc_subnet.develop.id
    nat       = var.vm_db_instance_network_interface_nat
  }
  metadata = {
    serial-port-enable = var.vm_metadata["serial-port-enable"]
    ssh-keys           = "ubuntu:${local.key_ssh}"
  }

}