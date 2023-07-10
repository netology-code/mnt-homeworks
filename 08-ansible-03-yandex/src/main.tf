resource "yandex_vpc_network" "develop" {
  name = var.vpc_name
}
resource "yandex_vpc_subnet" "develop" {
  name           = var.vpc_name
  zone           = var.default_zone
  network_id     = yandex_vpc_network.develop.id
  v4_cidr_blocks = var.default_cidr
}

data "yandex_compute_image" "ubuntu" {
  family = var.vm_name
}


resource "local_file" "hosts_cfg" {
  content = templatefile("${path.module}/hosts2.tftpl",

    { 
       for_each-vm = yandex_compute_instance.platform-2,
       count-vm = yandex_compute_instance.web,
       lighthouse = yandex_compute_instance.platform-2
    } 
  )

  filename = "/home/senibratov/github/mnt-homeworks/08-ansible-03-playbook/playbook/inventory/inventory.yml"
} 


# resource "null_resource" "web_hosts_provision" {
# #Ждем создания инстанса
# depends_on = [yandex_compute_instance.example]

# #Добавление ПРИВАТНОГО ssh ключа в ssh-agent
#   provisioner "local-exec" {
#     command = "cat ~/.ssh/id_rsa | ssh-add -"
#   }

# #Костыль!!! Даем ВМ время на первый запуск. Лучше выполнить это через wait_for port 22 на стороне ansible
#  provisioner "local-exec" {
#     command = "sleep 30"
#   }

# #Запуск ansible-playbook
#   provisioner "local-exec" {                  
#     command  = "export ANSIBLE_HOST_KEY_CHECKING=False; ansible-playbook -i inventory/inventory.yml ./site.yml"
#     on_failure = continue #Продолжить выполнение terraform pipeline в случае ошибок
#     environment = { ANSIBLE_HOST_KEY_CHECKING = "False" }
#     #срабатывание триггера при изменении переменных
#   }
#     # triggers = {  
#     #   always_run         = "${timestamp()}" #всегда т.к. дата и время постоянно изменяются
#     #   playbook_src_hash  = file("${abspath(path.module)}/test.yml") # при изменении содержимого playbook файла
#     #   ssh_public_key     = var.public_key # при изменении переменной
#     # }

# }