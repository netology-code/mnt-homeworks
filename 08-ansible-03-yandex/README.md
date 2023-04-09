## Подготовка к выполнению

1. Подготовьте в Yandex Cloud три хоста: для `clickhouse`, для `vector` и для `lighthouse`.

<p align="left">
 <img src="https://imgur.com/a/ZI47mGz">
</p>

Ссылка на репозиторий LightHouse: https://github.com/VKCOM/lighthouse

## Основная часть

1. Допишите playbook: нужно сделать ещё один play, который устанавливает и настраивает lighthouse.

``yaml
- название: Установить NGINX
  хосты: lighthouse
  обработчики:
 - название: start-nginx
      стать: истинным
      команда: nginx
 - название: перезагрузка-nginx
      стать: истинным
      команда: перезагрузка nginx -s
  задачи: 
 - название: Установить epel-релиз
      стать: истинным
      ansible.builtin.yum:
        название: epel-release.noarch
        состояние: последняя версия
 - название: Установить NGINX
      стать: истинным
      ansible.builtin.yum:
        название: nginx
        состояние: настоящее время
      уведомить: запустить-nginx
 - название: Создать общую конфигурацию NGINX
      стать: истинным
      шаблон:
        src: "template/nging.conf.j2"
        dest: "/etc/nginx/nginx.conf"
        режим: 0755
      уведомить: перезагрузить-nginx
      теги: установить nginx
- название: Установить маяк
  обработчики:
 - название: start-nginx
    стать: истинным
    команда: nginx
 - название: перезагрузка-nginx
    стать: истинным
    команда: перезагрузка nginx -s
  хосты: lighthouse
  предварительные задачи:
 - название: Установить маяк зависимостей
      стать: истинным
      ansible.builtin.yum:
        название: git
        состояние: настоящее время
  задачи:
 - название: Копия из git lighthouse
      git:
        репо: "{{ lighthouse_vcs }}"
        версия: master
        dest: "{{ lighthouse_location_dir }}"
 - название: Создать конфигурацию маяка
      стать: истинным
      шаблон:
        src: "шаблон/lighthouse.conf.j2"
        dest: "/etc/nginx/conf.d/default.conf"
        режим: 0644
      уведомить: перезагрузить-nginx
```

2. При создании tasks рекомендую использовать модули: `get_url`, `template`, `yum`, `apt`.

3. Tasks должны: скачать статику lighthouse, установить nginx или любой другой webserver, настроить его конфиг для открытия lighthouse, запустить webserver.

``yaml
пользователь lsd; 
worker_processes 1; 
error_log /var/log/nginx/ошибка.log;
pid /var/выполнить/nginx.pid;
события {
  worker_connections 1024; ## По умолчанию: 1024
}
http {
  включить /etc/nginx/mime.types;
  default_type приложение/октет-поток;
  log_format main '$remote_addr - $remote_user [$time_local] $статус '
    '"$request" $body_bytes_sent "$http_referer" '
    '"$http_user_agent" "$http_x_forwarded_for"';
  access_log /var/log/nginx/access.log главная;
  отправить файл на;
  #tcp_nopush на;
  
  сохраняйте время выполнения 65;
  gzip на;
  включить /etc/nginx/conf.d/*.conf;
```

4. Приготовьте свой собственный inventory файл `prod.yml`.

``yaml
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

9. Подготовьте [README.md](https://github.com/NamorNinayzuk/mnt-homeworks/tree/MNT-video/08-ansible-03-yandex/README.md) файл по своему playbook. В нём должно быть описано: что делает playbook, какие у него есть параметры и теги.

10. Готовый playbook выложите в свой репозиторий, поставьте тег `08-ansible-03-yandex` на фиксирующий коммит, в ответ предоставьте ссылку на него.

https://github.com/NamorNinayzuk/mnt-homeworks/tree/MNT-video/08-ansible-03-yandex/playbook
