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
   * Устраняем все ошибки при выполнении `ansible-lint site.yaml`
```shell
dpopov@dpopov-test:~/mnt-hwk/playbook$ ansible-lint site.yml
WARNING  Overriding detected file kind 'yaml' with 'playbook' for given positional argument: site.yml
dpopov@dpopov-test:~/mnt-hwk/playbook$
```
6. Попробуйте запустить playbook на этом окружении с флагом `--check`.
   * Запускаем `sudo ansible-playbook -i inventory/prod.yml site.yml  --check` и получаем ошибки
```shell
dpopov@dpopov-test:~/mnt-hwk/playbook$ sudo ansible-playbook -i inventory/prod.yml site.yml  --check

PLAY [all] *****************************************************************************************************************************************************************************************************************************

TASK [Check for Python] ****************************************************************************************************************************************************************************************************************
skipping: [clickhouse-01]
skipping: [lighthouse-01]
skipping: [vector-01]

TASK [Install Python] ******************************************************************************************************************************************************************************************************************
fatal: [clickhouse-01]: FAILED! => {"msg": "The conditional check 'check_python.rc != 0' failed. The error was: error while evaluating conditional (check_python.rc != 0): 'dict object' has no attribute 'rc'\n\nThe error appears to be in '/home/dpopov/mnt-hwk/playbook/site.yml': line 12, column 5, but may\nbe elsewhere in the file depending on the exact syntax problem.\n\nThe offending line appears to be:\n\n\n  - name: Install Python\n    ^ here\n"}
fatal: [vector-01]: FAILED! => {"msg": "The conditional check 'check_python.rc != 0' failed. The error was: error while evaluating conditional (check_python.rc != 0): 'dict object' has no attribute 'rc'\n\nThe error appears to be in '/home/dpopov/mnt-hwk/playbook/site.yml': line 12, column 5, but may\nbe elsewhere in the file depending on the exact syntax problem.\n\nThe offending line appears to be:\n\n\n  - name: Install Python\n    ^ here\n"}
fatal: [lighthouse-01]: FAILED! => {"msg": "The conditional check 'check_python.rc != 0' failed. The error was: error while evaluating conditional (check_python.rc != 0): 'dict object' has no attribute 'rc'\n\nThe error appears to be in '/home/dpopov/mnt-hwk/playbook/site.yml': line 12, column 5, but may\nbe elsewhere in the file depending on the exact syntax problem.\n\nThe offending line appears to be:\n\n\n  - name: Install Python\n    ^ here\n"}

PLAY RECAP *****************************************************************************************************************************************************************************************************************************
clickhouse-01              : ok=0    changed=0    unreachable=0    failed=1    skipped=1    rescued=0    ignored=0
lighthouse-01              : ok=0    changed=0    unreachable=0    failed=1    skipped=1    rescued=0    ignored=0
vector-01                  : ok=0    changed=0    unreachable=0    failed=1    skipped=1    rescued=0    ignored=0

```
7. Запустите playbook на `prod.yml` окружении с флагом `--diff`. Убедитесь, что изменения на системе произведены.
   * После прогона плейбука "с нуля" получаем такой результат:
```shell
PLAY RECAP *****************************************************************************************************************************************************************************************************************************
clickhouse-01              : ok=11   changed=8    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0
lighthouse-01              : ok=13   changed=9    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0
vector-01                  : ok=9    changed=6    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0

```
8. Повторно запустите playbook с флагом `--diff` и убедитесь, что playbook идемпотентен.
   * После повторного запуска плэйбука видим, что результат идемпотентен:
```shell
PLAY RECAP *****************************************************************************************************************************************************************************************************************************
clickhouse-01              : ok=10   changed=0    unreachable=0    failed=0    skipped=1    rescued=0    ignored=0
lighthouse-01              : ok=12   changed=0    unreachable=0    failed=0    skipped=1    rescued=0    ignored=0
vector-01                  : ok=8    changed=0    unreachable=0    failed=0    skipped=1    rescued=0    ignored=0
```
9. Подготовьте README.md файл по своему playbook. В нём должно быть описано: что делает playbook, какие у него есть параметры и теги.
   * [Ссылка](https://github.com/rowhe/mnt-hwk/blob/3f71a5a1a61c250174bf3abad1580e89cf6af017/README.md) на README.md от плэйбука
   
11. Готовый playbook выложите в свой репозиторий, поставьте тег `08-ansible-03-yandex` на фиксирующий коммит, в ответ предоставьте ссылку на него.
    * [Ссылка](git@github.com:rowhe/mnt-hwk.git) на репозиторий с работающим плэйбуком

---

### Как оформить ДЗ?

Выполненное домашнее задание пришлите ссылкой на .md-файл в вашем репозитории.

---
