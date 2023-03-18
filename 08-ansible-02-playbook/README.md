# Домашнее задание к занятию "2. Работа с Playbook"

## Подготовка к выполнению

1. (Необязательно) Изучите, что такое [clickhouse](https://www.youtube.com/watch?v=fjTNS2zkeBs) и [vector](https://www.youtube.com/watch?v=CgEhyffisLY)
2. Создайте свой собственный (или используйте старый) публичный репозиторий на github с произвольным именем.
3. Скачайте [playbook](./playbook/) из репозитория с домашним заданием и перенесите его в свой репозиторий.
4. Подготовьте хосты в соответствии с группами из предподготовленного playbook.

## Основная часть

1. Приготовьте свой собственный inventory файл `prod.yml`

 <details>
  <summary> [prod.yml](https://github.com/NamorNinayzuk/mnt-homeworks/blob/MNT-video/08-ansible-02-playbook/playbook/inventory/prod.yml "жмакай") </summary>

  ```
  ---
clickhouse:
  hosts:
    clickhouse-01:
      ansible_host: "172.17.0.110"
  ```
</details>

2. Допишите playbook: нужно сделать ещё один play, который устанавливает и настраивает [vector](https://vector.dev).
 
![Play_install_deb_pack_vector](https://imgur.com/a/gUdVPXT)

![Play_install_deb_pack_clickhouse](https://i.imgur.com/LyPSTf4.png)

![Play_deinstall_deb_pack_vector](https://i.imgur.com/mbHQkO7.png)

![Play_deinstall_deb_pack_clickhouse](https://i.imgur.com/QdtNPxo.png)

3. При создании tasks рекомендую использовать модули: `get_url`, `template`, `unarchive`, `file`.
  - <details><summary>Mods</summary>
    <pre>
ansible.builtin.get_url
ansible.builtin.apt
ansible.builtin.meta
ansible.builtin.pause
ansible.builtin.command
ansible.builtin.file
ansible.builtin.unarchive
ansible.builtin.copy
ansible.builtin.replace
ansible.builtin.user
ansible.builtin.service
ansible.builtin.systemd
    </pre>
   </details>
4. Tasks должны: скачать нужной версии дистрибутив, выполнить распаковку в выбранную директорию, установить vector.
<details>
  <summary>All in  [site.yml](https://github.com/NamorNinayzuk/mnt-homeworks/blob/MNT-video/08-ansible-02-playbook/playbook/site.yml "жмакай")  </summary>

  ```
  ---
- name: Install Clickhouse & Vector
  hosts: clickhouse
  gather_facts: false

  handlers:
    - name: Start clickhouse service
      become: true
      ansible.builtin.service:
        name: clickhouse-server
        state: restarted

    - name: Start Vector service
      become: true
      ansible.builtin.systemd:
        daemon_reload: true
        enabled: false
        name: vector.service
        state: started

  tasks:
    - block:
        - block:
            - name: Clickhouse. Get clickhouse distrib
              ansible.builtin.get_url:
                url: "https://packages.clickhouse.com/deb/pool/stable/{{ item }}_{{ clickhouse_version }}_all.deb"
                dest: "./{{ item }}_{{ clickhouse_version }}_all.deb"
                mode: 0644
              with_items: "{{ clickhouse_packages }}"
          rescue:
            - name: Clickhouse. Get clickhouse distrib
              ansible.builtin.get_url:
                url: "https://packages.clickhouse.com/deb/pool/stable/clickhouse-common-static_{{ clickhouse_version }}_amd64.deb"
                dest: "./clickhouse-common-static_{{ clickhouse_version }}_amd64.deb"
                mode: 0644
              with_items: "{{ clickhouse_packages }}"

        - name: Clickhouse. Install package clickhouse-common-static
          become: true
          ansible.builtin.apt:
            deb: ./clickhouse-common-static_{{ clickhouse_version }}_amd64.deb
          notify: Start clickhouse service

        - name: Clickhouse. Install package clickhouse-client
          become: true
          ansible.builtin.apt:
            deb: ./clickhouse-client_{{ clickhouse_version }}_all.deb
          notify: Start clickhouse service

        - name: Clickhouse. Install clickhouse package clickhouse-server
          become: true
          ansible.builtin.apt:
            deb: ./clickhouse-server_{{ clickhouse_version }}_all.deb
          notify: Start clickhouse service

        - name: Clickhouse. Flush handlers
          ansible.builtin.meta: flush_handlers

        - name: Clickhouse. Waiting while clickhouse-server is available...
          ansible.builtin.pause:
            seconds: 10
            echo: false

        - name: Clickhouse. Create database
          ansible.builtin.command: "clickhouse-client -q 'create database logs;'"
          register: create_db
          failed_when: create_db.rc != 0 and create_db.rc !=82
          changed_when: create_db.rc == 0
      tags: clickhouse

    - block:
        - name: Vector. Create work directory
          ansible.builtin.file:
            path: "{{ vector_workdir }}"
            state: directory
            mode: 0755

        - name: Vector. Get Vector distributive
          ansible.builtin.get_url:
            url: "https://packages.timber.io/vector/{{ vector_version }}/vector-{{ vector_version }}-{{ vector_os_arh }}-unknown-linux-gnu.tar.gz"
            dest: "{{ vector_workdir }}/vector-{{ vector_version }}-{{ vector_os_arh }}-unknown-linux-gnu.tar.gz"
            mode: 0644

        - name: Vector. Unzip archive
          ansible.builtin.unarchive:
            remote_src: true
            src: "{{ vector_workdir }}/vector-{{ vector_version }}-{{ vector_os_arh }}-unknown-linux-gnu.tar.gz"
            dest: "{{ vector_workdir }}"

        - name: Vector. Install vector binary file
          become: true
          ansible.builtin.copy:
            remote_src: true
            src: "{{ vector_workdir }}/vector-{{ vector_os_arh }}-unknown-linux-gnu/bin/vector"
            dest: "/usr/bin/"
            mode: 0755
            owner: root
            group: root

        - name: Vector. Check Vector installation
          ansible.builtin.command: "vector --version"
          register: var_vector
          failed_when: var_vector.rc != 0
          changed_when: var_vector.rc == 0

        - name: Vector. Create Vector config vector.toml
          become: true
          ansible.builtin.copy:
            remote_src: true
            src: "{{ vector_workdir }}/vector-{{ vector_os_arh }}-unknown-linux-gnu/config/vector.toml"
            dest: "/etc/vector/"
            mode: 0644
            owner: root
            group: root

        - name: Vector. Create vector.service daemon
          become: true
          ansible.builtin.copy:
            remote_src: true
            src: "{{ vector_workdir }}/vector-{{ vector_os_arh }}-unknown-linux-gnu/etc/systemd/vector.service"
            dest: "/lib/systemd/system/"
            mode: 0644
            owner: root
            group: root
          notify: Start Vector service

        - name: Vector. Modify vector.service file
          become: true
          ansible.builtin.replace:
            backup: true
            path: "/lib/systemd/system/vector.service"
            regexp: "^ExecStart=/usr/bin/vector$"
            replace: "ExecStart=/usr/bin/vector --config /etc/vector/vector.toml"
          notify: Start Vector service

        - name: Vector. Create user vector
          become: true
          ansible.builtin.user:
            create_home: false
            name: "{{ vector_os_user }}"

        - name: Vector. Create data_dir
          become: true
          ansible.builtin.file:
            path: "/var/lib/vector"
            state: directory
            mode: 0755
            owner: "{{ vector_os_user }}"


        - name: Vector. Remove work directory
          ansible.builtin.file:
            path: "{{ vector_workdir }}"
            state: absent

      tags: vector

  ```
</details>
5. Запустите `ansible-lint site.yml` и исправьте ошибки, если они есть.

![ansible-lint](https://i.imgur.com/EQQbee9.png)

6. Попробуйте запустить playbook на этом окружении с флагом `--check`.

![check-kek-chebureg](https://i.imgur.com/vtgI53W.png)

7. Запустите playbook на `prod.yml` окружении с флагом `--diff`. Убедитесь, что изменения на системе произведены.

![1](https://i.imgur.com/XwDE6A4.png)

![2](https://i.imgur.com/hAFMIWp.png)

![3](https://i.imgur.com/nwWK9W4.png)

![4](https://i.imgur.com/NAGswJQ.png)

8. Повторно запустите playbook с флагом `--diff` и убедитесь, что playbook идемпотентен.

![1](https://i.imgur.com/ZgY4OQF.png)

![2](https://i.imgur.com/4ZA5LsP.png)

![3](https://i.imgur.com/C4kBZTX.png)

9. Подготовьте README.md файл по своему playbook. В нём должно быть описано: что делает playbook, какие у него есть параметры и теги.

[playbook/site.yml](https://github.com/NamorNinayzuk/mnt-homeworks/blob/MNT-video/08-ansible-02-playbook/playbook/site.yml "жмакай") содержит 2 блока задач:

<details>
  <summary>Первый</summary>

  ```
   Блок инсталяции Clickhouse. Тэг - clickhouse. В нем:
clickhouse_version: "22.3.3.44" - версия Clickhouse
clickhouse_packages: ["clickhouse-client", "clickhouse-server", "clickhouse-common-static"] - список пакетов для установки
Task'и:
TASK [Clickhouse. Get clickhouse distrib] - скачивает deb-пакеты с дистрибутивами с помощью модуля ansible.builtin.get_url
TASK [Clickhouse. Install package clickhouse-common-static] - устанавливает deb-пакет с помощью модуля ansible.builtin.apt
TASK [Clickhouse. Install package clickhouse-client] - устанавливает deb-пакет с помощью модуля ansible.builtin.apt
TASK [Clickhouse. Install clickhouse package clickhouse-server] - устанавливает deb-пакеты с помощью модуля ansible.builtin.apt
TASK [Clickhouse. Flush handlers] - инициирует внеочередной запуск хандлера Start clickhouse service
RUNNING HANDLER [Start clickhouse service] - для старта сервера clickhouse в хандлере используется модуль ansible.builtin.service
TASK [Clickhouse. Waiting while clickhouse-server is available...] - устанавливает паузу в 10 секунд с помощью модуля ansible.builtin.pause, чтобы сервер Clickhouse успел запуститься. Иначе следующая задача по созданию БД может завершиться ошибкой, т.к. сервер еще не успел подняться
TASK [Clickhouse. Create database] - создает инстанс базы данных Clickhouse
  ```
</details>

<details>
  <summary>Второй</summary>

  ```
 Блок инсталяции Vector. Тэг - vector. Используются параметры:
vector_version: "0.21.1" - версия Vector
vector_os_arh: "x86_64" - архитектура ОС
vector_workdir: "/home/vector" - рабочий каталог, в котором будут сохранены скачанные deb-пакеты
vector_os_user: "vector" - имя пользователя-владельца Vector в ОС
vector_os_group: "vector" - имя группы пользователя-владельца Vector в ОС
Task'и:
TASK [Vector. Create work directory] - создает рабочий каталог, в котором будут сохранены скачанные deb-пакеты, с помощью модуля ansible.builtin.file
TASK [Vector. Get Vector distributive] - скачивает архив с дистрибутивом с помощью модуля ansible.builtin.get_url
TASK [Vector. Unzip archive] - распаковывает скачанный архив с помощью модуля ansible.builtin.unarchive
TASK [Vector. Install vector binary file] - копирует исполняемый файл Vector в /usr/bin с помощью модуля ansible.builtin.copy
TASK [Vector. Check Vector installation] - проверяет, что бинарный файл Vector работает корректно, с помощью модуля ansible.builtin.command
TASK [Vector. Create Vector config vector.toml] - создает файл /etc/vector/vector.toml с конфигом Vector с помощью модуля ansible.builtin.copy
TASK [Vector. Create vector.service daemon] - создает файл юнита systemd /lib/systemd/system/vector.service с помощью модуля ansible.builtin.copy
TASK [Vector. Modify vector.service file] - редактирует файл юнита systemd /lib/systemd/system/vector.service с помощью модуля ansible.builtin.replace
TASK [Vector. Create user vector] - создает пользователя ОС с помощью модуля ansible.builtin.user
TASK [Vector. Create data_dir] - создает каталог дял данных Vector с помощью модуля ansible.builtin.file
TASK [Vector. Remove work directory] - удаляет рабочий каталог с помощью модуля ansible.builtin.file
RUNNING HANDLER [Start Vector service] - инициируется запуск хандлера Start Vector service, обновляющего конфигурацию systemd и стартующего сервис vector.service с помощью модуляansible.builtin.systemd
  ```
</details>

10. Готовый playbook выложите в свой репозиторий, поставьте тег `08-ansible-02-playbook` на фиксирующий коммит, в ответ предоставьте ссылку на него.

[playbook](https://github.com/NamorNinayzuk/mnt-homeworks/tree/MNT-video/08-ansible-02-playbook/playbook "жмакай")
---

### Как оформить ДЗ?

Выполненное домашнее задание пришлите ссылкой на .md-файл в вашем репозитории.

---
