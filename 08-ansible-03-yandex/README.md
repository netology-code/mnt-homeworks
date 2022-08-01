# Домашнее задание к занятию "08.03 Использование Yandex Cloud"

## Подготовка к выполнению

1. Подготовьте в Yandex Cloud три хоста: для `clickhouse`, для `vector` и для `lighthouse`.
    * Все три хоста будут запущены в докере:
   - Vector (хост vec)
   - Lighthouse+Nginx (хост lh)
   - Clickhouse (хост ch)

## Основная часть

1. Допишите playbook: нужно сделать ещё один play, который устанавливает и настраивает lighthouse.
2. При создании tasks рекомендую использовать модули: `get_url`, `template`, `yum`, `apt`.
3. Tasks должны: скачать статику lighthouse, установить nginx или любой другой webserver, настроить его конфиг для открытия lighthouse, запустить webserver.
   * Дописываем play для установки и настройки lighthouse
```shell
    - name: Installing nginx
  hosts: lighthouse-01
  tasks:
  - name: Installing nginx package
    ansible.builtin.package:
      name:
        - nginx
      state: present

- name: Lighthouse
  hosts: lighthouse-01
  tasks:
    - name: Creating "files" directory
      file:
        path: ./files
        state: directory
        mode: 755
    - name: Downloading lighthouse
      get_url:
        url:  https://github.com/VKCOM/lighthouse/archive/refs/heads/master.zip
        dest: ./files/lighthouse.zip
        mode: 644
    - name: Unarchiving Lighthouse
      unarchive:
        src: ./files/lighthouse.zip
        dest: ./files
        remote_src: yes
    - name: Copying lighthouse files to /var/www
      copy:
        src: ./files/lighthouse-master
        dest: /var/www
        remote_src: yes

    - name: Enabling lighthouse site in nginx config file
      copy:
        src: templates/nginx_sites_enabled.conf.j2
        dest: /etc/nginx/sites-available/default
    - name: Starting nginx
      service:
        name: nginx
        pattern: nginx
        state: started
```
4. Приготовьте свой собственный inventory файл `prod.yml`.
    * Дорабатываем inventory/prod.yml
```shell
---
clickhouse:
  hosts:
    clickhouse-01:
      ansible_host: ch
      ansible_connection: docker

vector:
  hosts:
    vector-01:
      ansible_host: vec
      ansible_connection: docker

lighthouse:
  hosts:
    lighthouse-01:
      ansible_host: lh
      ansible_connection: docker

```
5. Запустите `ansible-lint site.yml` и исправьте ошибки, если они есть.
6. Попробуйте запустить playbook на этом окружении с флагом `--check`.
7. Запустите playbook на `prod.yml` окружении с флагом `--diff`. Убедитесь, что изменения на системе произведены.
```shell

```
8. Повторно запустите playbook с флагом `--diff` и убедитесь, что playbook идемпотентен.
9. Подготовьте README.md файл по своему playbook. В нём должно быть описано: что делает playbook, какие у него есть параметры и теги.
10. Готовый playbook выложите в свой репозиторий, поставьте тег `08-ansible-03-yandex` на фиксирующий коммит, в ответ предоставьте ссылку на него.

---

### Как оформить ДЗ?

Выполненное домашнее задание пришлите ссылкой на .md-файл в вашем репозитории.

---
