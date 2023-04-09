## Подготовка к выполнению

1. Подготовьте в Yandex Cloud три хоста: для `clickhouse`, для `vector` и для `lighthouse`.


![Yandex Cloud]([https://imgur.com/a/ZI47mGz](https://i.imgur.com/YDbMeOd.png))
Ссылка на репозиторий LightHouse: https://github.com/VKCOM/lighthouse

## Основная часть

1. Допишите playbook: нужно сделать ещё один play, который устанавливает и настраивает lighthouse.

```yaml
- name: Install NGINX
  hosts: lighthouse
  handlers:
    - name: start-nginx
      become: true
      command: nginx
    - name: reload-nginx
      become: true
      command: nginx -s reload
  tasks: 
    - name: Install epel-release
      become: true
      ansible.builtin.yum:
        name: epel-release.noarch
        state: latest
    - name: Install NGINX
      become: true
      ansible.builtin.yum:
        name: nginx
        state: present
      notify: start-nginx
    - name: Create general config NGINX
      become: true
      template:
        src: "template/nging.conf.j2"
        dest: "/etc/nginx/nginx.conf"
        mode: 0755
      notify: reload-nginx
      tags: install nginx
- name: Install lighthouse
  handlers:
  - name: start-nginx
    become: true
    command: nginx
  - name: reload-nginx
    become: true
    command: nginx -s reload
  hosts: lighthouse
  pre_tasks:
    - name: Install dependencies lighthouse
      become: true
      ansible.builtin.yum:
        name: git
        state: present
  tasks:
    - name: Copy from git lighthouse
      git:
        repo: "{{ lighthouse_vcs }}"
        version: master
        dest: "{{ lighthouse_location_dir }}"
    - name: Create lighthouse config
      become: true
      template:
        src: "template/lighthouse.conf.j2"
        dest: "/etc/nginx/conf.d/default.conf"
        mode: 0644
      notify: reload-nginx
```

2. При создании tasks рекомендую использовать модули: `get_url`, `template`, `yum`, `apt`.

3. Tasks должны: скачать статику lighthouse, установить nginx или любой другой webserver, настроить его конфиг для открытия lighthouse, запустить webserver.

```yaml
user       lsd;  ## Default: nobody
worker_processes  1;  ## Default: 1
error_log  /var/log/nginx/error.log;
pid        /var/run/nginx.pid;
events {
  worker_connections  1024;  ## Default: 1024
}
http {
  include    /etc/nginx/mime.types;
  default_type application/octet-stream;
  log_format   main '$remote_addr - $remote_user [$time_local]  $status '
    '"$request" $body_bytes_sent "$http_referer" '
    '"$http_user_agent" "$http_x_forwarded_for"';
  access_log   /var/log/nginx/access.log  main;
  sendfile     on;
  #tcp_nopush   on;
  
  keepalive_timeout 65;
  gzip on;
  include /etc/nginx/conf.d/*.conf;
```

4. Приготовьте свой собственный inventory файл `prod.yml`.

```yaml
---
clickhouse:
  hosts:
    clickhouse:
      ansible_host: 130.193.34.245
      ansible_user: admin
vector:
  hosts:
    vector:
      ansible_host: 158.160.19.60
      ansible_user: admin
lighthouse:
  hosts:
    lighthouse:
      ansible_host: 158.160.17.118
      ansible_user: admin

```

5. Запустите `ansible-lint site.yml` и исправьте ошибки, если они есть.

6. Попробуйте запустить playbook на этом окружении с флагом `--check`.

7. Запустите playbook на `prod.yml` окружении с флагом `--diff`. Убедитесь, что изменения на системе произведены.

8. Повторно запустите playbook с флагом `--diff` и убедитесь, что playbook идемпотентен.

9. Подготовьте README.md файл по своему playbook. В нём должно быть описано: что делает playbook, какие у него есть параметры и теги.
[README.md](https://github.com/NamorNinayzuk/mnt-homeworks/tree/MNT-video/08-ansible-03-yandex/README.md)
10. Готовый playbook выложите в свой репозиторий, поставьте тег `08-ansible-03-yandex` на фиксирующий коммит, в ответ предоставьте ссылку на него.
[Playbook](https://github.com/NamorNinayzuk/mnt-homeworks/tree/MNT-video/08-ansible-03-yandex/playbook)
