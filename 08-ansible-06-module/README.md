# Домашнее задание по лекции "8.6 Создание собственных Modules"

## Подготовка к выполнению

> 1. Создайте пустой публичных репозиторий в любом своём проекте: `my_own_collection`
> 2. Скачайте репозиторий ansible: `git clone https://github.com/ansible/ansible.git` по любому удобному вам пути
> 3. Зайдите в директорию ansible: `cd ansible`
> 4. Создайте виртуальное окружение: `python3 -m venv venv`
> 5. Активируйте виртуальное окружение: `. venv/bin/activate`. Дальнейшие действия производятся только в виртуальном окружении
> 6. Установите зависимости `pip install -r requirements.txt`
> 7. Запустить настройку окружения `. hacking/env-setup`
> 8. Если все шаги прошли успешно - выйти из виртуального окружения `deactivate`
> 9. Ваше окружение настроено, для того чтобы запустить его, нужно находиться в директории `ansible` и выполнить конструкцию `. venv/bin/activate && . hacking/env-setup`
```console
root@debian:~/my-ansible-6/ansible$ python3 -m venv venv
root@debian:~/my-ansible-6/ansible$ . venv/bin/activate
(venv) root@debian:~/my-ansible-6/ansible$ pip install -r requirements.txt
Collecting jinja2>=3.0.0
  Using cached Jinja2-3.1.2-py3-none-any.whl (133 kB)
Collecting PyYAML>=5.1
  Downloading PyYAML-6.0-cp310-cp310-manylinux_2_5_x86_64.manylinux1_x86_64.manylinux_2_12_x86_64.manylinux2010_x86_64.whl (682 kB)
     ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ 682.2/682.2 kB 3.5 MB/s eta 0:00:00
Collecting cryptography
  Using cached cryptography-37.0.4-cp36-abi3-manylinux_2_24_x86_64.whl (4.1 MB)
Collecting packaging
  Using cached packaging-21.3-py3-none-any.whl (40 kB)
Collecting resolvelib<0.9.0,>=0.5.3
  Using cached resolvelib-0.8.1-py2.py3-none-any.whl (16 kB)
Collecting MarkupSafe>=2.0
  Using cached MarkupSafe-2.1.1-cp310-cp310-manylinux_2_17_x86_64.manylinux2014_x86_64.whl (25 kB)
Collecting cffi>=1.12
  Using cached cffi-1.15.1-cp310-cp310-manylinux_2_17_x86_64.manylinux2014_x86_64.whl (441 kB)
Collecting pyparsing!=3.0.5,>=2.0.2
  Using cached pyparsing-3.0.9-py3-none-any.whl (98 kB)
Collecting pycparser
  Using cached pycparser-2.21-py2.py3-none-any.whl (118 kB)
Installing collected packages: resolvelib, PyYAML, pyparsing, pycparser, MarkupSafe, packaging, jinja2, cffi, cryptography
Successfully installed MarkupSafe-2.1.1 PyYAML-6.0 cffi-1.15.1 cryptography-37.0.4 jinja2-3.1.2 packaging-21.3 pycparser-2.21 pyparsing-3.0.9 resolvelib-0.8.1
(venv) root@debian:~/my-ansible-6/ansible$ . hacking/env-setup
running egg_info
creating lib/ansible_core.egg-info
writing lib/ansible_core.egg-info/PKG-INFO
writing dependency_links to lib/ansible_core.egg-info/dependency_links.txt
writing entry points to lib/ansible_core.egg-info/entry_points.txt
writing requirements to lib/ansible_core.egg-info/requires.txt
writing top-level names to lib/ansible_core.egg-info/top_level.txt
writing manifest file 'lib/ansible_core.egg-info/SOURCES.txt'
reading manifest file 'lib/ansible_core.egg-info/SOURCES.txt'
reading manifest template 'MANIFEST.in'
warning: no files found matching 'SYMLINK_CACHE.json'
warning: no previously-included files found matching 'docs/docsite/rst_warnings'
warning: no previously-included files found matching 'docs/docsite/rst/conf.py'
warning: no previously-included files found matching 'docs/docsite/rst/index.rst'
warning: no previously-included files found matching 'docs/docsite/rst/dev_guide/index.rst'
warning: no previously-included files matching '*' found under directory 'docs/docsite/_build'
warning: no previously-included files matching '*.pyc' found under directory 'docs/docsite/_extensions'
warning: no previously-included files matching '*.pyo' found under directory 'docs/docsite/_extensions'
warning: no files found matching '*.ps1' under directory 'lib/ansible/modules/windows'
warning: no files found matching '*.yml' under directory 'lib/ansible/modules'
warning: no files found matching 'validate-modules' under directory 'test/lib/ansible_test/_util/controller/sanity/validate-modules'
adding license file 'COPYING'
writing manifest file 'lib/ansible_core.egg-info/SOURCES.txt'

Setting up Ansible to run out of checkout...

PATH=/home/my-ansible-6/ansible/bin:/home/my-ansible-6/ansible/venv/bin:/home/.local/bin:/usr/bin:/home/.local/bin:/home/yandex-cloud/bin:/usr/local/bin:/usr/bin:/bin:/usr/local/games:/usr/games
PYTHONPATH=/home/my-ansible-6/ansible/test/lib:/home/my-ansible-6/ansible/lib
MANPATH=/home/my-ansible-6/ansible/docs/man:/usr/share/man:/usr/local/man:/usr/local/share/man

Remember, you may wish to specify your host file with -i

Done!

(venv) root@debian:~/my-ansible-6/ansible$ deactivate
root@debian:~/my-ansible-6/ansible$
```

## Основная часть

Наша цель - написать собственный module, который мы можем использовать в своей role, через playbook.
Всё это должно быть собрано в виде collection и отправлено в наш репозиторий.

### 1. В виртуальном окружении создать новый `my_own_module.py` файл

Встроенные модули **Ansible** находятся по пути `lib/ansible/modules`, там и будем создавать файл, только с именем `file_content.py`

---

### 2. Наполнить его содержимым из [статьи](https://docs.ansible.com/ansible/latest/dev_guide/developing_modules_general.html#creating-a-module)

---

### 3. Перепишите файл в соответствии с требованиями ansible так, чтобы он выполнял следующую задачу

**Module** должен создавать текстовый файл на удалённом хосте по пути, определённом в параметре `path`, с содержимым, определённым в параметре `content`.

Готовый файл в репозитории: [file_content.py](https://github.com/NamorNinayzuk/ansible-collection/blob/main/plugins/modules/file_content.py)

---

### 4. Проверьте module на исполняемость локально.

Для проверки модуля на исполняемость локально можно запустить его непостредственно в **Python** передав **JSON** файл с нужным содержимым

Пример передаваемого **JSON** файла
```json
{
    "ANSIBLE_MODULE_ARGS": {
        "path": "test123",
        "content": "test line"
    }
}
```

Команда запуска: `python -m <модуль> <файл>`, где `<модуль>` - путь к исполняемому модулю (`ansible.modules.file_content` для модуля `file_content` из каталога встроенных в **Ansible**), а `<файл>` - **JSON** файл с входными данными

Первый запуск, когда файла нет:
```console
(venv) root@debian:~/my-ansible-6/ansible$ python -m ansible.modules.file_content payload.json

{"changed": true, "path": "test123", "content": "test line", "status": "created", "uid": 1000, "gid": 1000, "owner": "sa", "group": "sa", "mode": "0644", "state": "file", "size": 9, "invocation": {"module_args": {"path": "test123", "content": "test line"}}}
(venv) root@debian:~/my-ansible-6/ansible$
```

Результат:
```json
{
    "changed": true,
    "path": "test123",
    "content": "test line",
    "status": "created",
    "uid": 1000,
    "gid": 1000,
    "owner": "sa",
    "group": "sa",
    "mode": "0644",
    "state": "file",
    "size": 9,
    "invocation": {
        "module_args": {
            "path": "test123",
            "content": "test line"
        }
    }
}
```

Второй запуск, когда файл уже существует:
```console
(venv) root@debian:~/my-ansible-6/ansible$ python -m ansible.modules.file_content payload.json

{"changed": false, "path": "test123", "content": "test line", "status": "resisted", "uid": 1000, "gid": 1000, "owner": "sa", "group": "sa", "mode": "0644", "state": "file", "size": 9, "invocation": {"module_args": {"path": "test123", "content": "test line"}}}
(venv) root@debian:~/my-ansible-6/ansible$
```

Результат:
```json
{
    "changed": false,
    "path": "test123",
    "content": "test line",
    "status": "resisted",
    "uid": 1000,
    "gid": 1000,
    "owner": "sa",
    "group": "sa",
    "mode": "0644",
    "state": "file",
    "size": 9,
    "invocation": {
        "module_args": {
            "path": "test123",
            "content": "test line"
        }
    }
}
```

Третий запуск с изменённым параметром `content`:
```console
(venv) root@debian:~/my-ansible-6/ansible$ python -m ansible.modules.file_content payload.json

{"changed": true, "path": "test123", "content": "test line +add", "status": "modified", "uid": 1000, "gid": 1000, "owner": "sa", "group": "sa", "mode": "0644", "state": "file", "size": 14, "invocation": {"module_args": {"path": "test123", "content": "test line +add"}}}
(venv) root@debian:~/my-ansible-6/ansible$
```

Результат:
```json
{
    "changed": true,
    "path": "test123",
    "content": "test line +add",
    "status": "modified",
    "uid": 1000,
    "gid": 1000,
    "owner": "sa",
    "group": "sa",
    "mode": "0644",
    "state": "file",
    "size": 14,
    "invocation": {
        "module_args": {
            "path": "test123",
            "content": "test line +add"
        }
    }
}
```

**JSON** блок вывода дополняется следующими параметрами: **uid**, **gid**, **owner**, **group**, **mode**, **state**, **size**. Так происходит всегда, когда в модуле есть параметр с именем `path` или `dest`. Само добавление выполняется при завершении модуля (функция `exit_json`).

Также в результат всегда добавляется блок **invocation** (если его нет) с параметрами вызова модуля. Добавление также выпоняется при завершении модуля.

---

### 5. Напишите single task playbook и используйте module в нём.

Пример подобного **playbook**:
```yaml
---
- name: Test module
  hosts: localhost
  tasks:
    - name: run on test123
      file_content:
        path: 'test123'
        content: 'write test'
...
```

Исполнение **playbook**: (файла **test123** нет)
```console
(venv) root@debian:~/my-ansible-6/ansible$ ansible-playbook site.yml
[WARNING]: You are running the development version of Ansible. You should only run Ansible from "devel" if you are
modifying the Ansible engine, or trying out features under development. This is a rapidly changing source of code and
can become unstable at any point.
[WARNING]: No inventory was parsed, only implicit localhost is available
[WARNING]: provided hosts list is empty, only localhost is available. Note that the implicit localhost does not match
'all'

PLAY [Test module] *****************************************************************************************************

TASK [Gathering Facts] *************************************************************************************************
ok: [localhost]

TASK [run on test123 - write] *******************************************************************************************
changed: [localhost]

PLAY RECAP *************************************************************************************************************
localhost                  : ok=2    changed=1    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0

(venv) root@debian:~/my-ansible-6/ansible$
```

---

### 6. Проверьте через playbook на идемпотентность.

Повторный запуск **playbook** (файл **test123** уже существует):
```console
(venv) root@debian:~/my-ansible-6/ansible$ ansible-playbook site.yml
[WARNING]: You are running the development version of Ansible. You should only run Ansible from "devel" if you are
modifying the Ansible engine, or trying out features under development. This is a rapidly changing source of code and
can become unstable at any point.
[WARNING]: No inventory was parsed, only implicit localhost is available
[WARNING]: provided hosts list is empty, only localhost is available. Note that the implicit localhost does not match
'all'

PLAY [Test module] *****************************************************************************************************

TASK [Gathering Facts] *************************************************************************************************
ok: [localhost]

TASK [run on test123 - write] *******************************************************************************************
ok: [localhost]

PLAY RECAP *************************************************************************************************************
localhost                  : ok=2    changed=0    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0

(venv) root@debian:~/my-ansible-6/ansible$
```

---

### 7. Выйдите из виртуального окружения.

Выход из окружения выполняется командой `deactivate`

---

### 8. Инициализируйте новую collection my_own_namespace.yandex_cloud_elk

Инициализация новой **collection** выполняется по шаблону `ansible-galaxy collection init <пространство>.<коллекция>`, где `<пространство>` - Пространство имён автора (название группы для всех **collection** автора), `<коллекция>` - название **collection**

Создание своей **collection** (вместо `my_own_namespace.yandex_cloud_elk` используется `test.utils`):

```console
root@debian:~/my-ansible-6$ ansible-galaxy collection init test.utils
[WARNING]: You are running the development version of Ansible. You should only run Ansible from "devel" if you are
modifying the Ansible engine, or trying out features under development. This is a rapidly changing source of code and
can become unstable at any point.
- Collection test.utils was created successfully
root@debian:~/my-ansible-6$
```

---

### 9. В данную collection перенесите свой module в соответствующую директорию.

**Module** в **Ansible** это частный случай **plugin**, а значит и размещать его нужно внутри каталога **plugins**.
В соответствии с подсказкой **Ansible** (`plugins\readme.md`) модули должны размещаться в каталоге `plugins\modules`.

---

### 10. Single task playbook преобразуйте в single task role и перенесите в collection. У role должны быть default всех параметров module

Ссылка на **single task role** в **collection**: [file_content](https://github.com/NamorNinayzuk/ansible-collection/tree/main/roles/file_content)

---

### 11. Создайте playbook для использования этой role.

Ссылка на **playbook** в репозитории: [test_file_content](https://github.com/NamorNinayzuk/ansible-collection/blob/main/playbooks/test_file_content.yml)

---

### 12. Заполните всю документацию по collection, выложите в свой репозиторий, поставьте тег `1.0.0` на этот коммит.

Ссылка на репозиторий версии **1.0.0**: [Ansible-Collection](https://github.com/NamorNinayzuk/ansible-collection)

---

### 13. Создайте архив .tar.gz этой collection в корневой директории collection.

Архив **collection** создаётся командой `ansible-galaxy collection build`

```console
root@debian:~/my-ansible-6/utils$ ansible-galaxy collection build
[WARNING]: You are running the development version of Ansible. You should only run Ansible from "devel" if you are
modifying the Ansible engine, or trying out features under development. This is a rapidly changing source of code and
can become unstable at any point.
Created collection for test.utils at /home/my-ansible-6/utils/test-utils-1.0.0.tar.gz
root@debian:~/my-ansible-6/utils$
```

---

### 14. Создайте ещё одну директорию любого наименования, перенесите туда single task playbook и архив c collection.

```console
root@debian:~/my-ansible-6/final_test$ ls
test-utils-1.0.0.tar.gz  test_file_content.yml
root@debian:~/my-ansible-6/final_test$
```

---

### 15. Установите collection из локального архива

Установка **collection** из архива выполняется командой `ansible-galaxy collection install <архив.tar.gz>` - где `<архив.tar.gz>` - файл **.tar.gz** архива **collection**, созданный **Ansible**.
Если запрашиваемая версия уже установлена, но требуется её заменить нужно добавить ключ: `--force`

```console
root@debian:~/my-ansible-6/final_test$ ansible-galaxy collection install test-utils-1.0.0.tar.gz
[WARNING]: You are running the development version of Ansible. You should only run Ansible from "devel" if you are
modifying the Ansible engine, or trying out features under development. This is a rapidly changing source of code and
can become unstable at any point.
Starting galaxy collection install process
Process install dependency map
Starting collection install process
Installing 'test.utils:1.0.0' to '/home/.ansible/collections/ansible_collections/utils'
test.utils:1.0.0 was installed successfully
root@debian:~/my-ansible-6/final_test$
```

---

### 16. Запустите playbook, убедитесь, что он работает.

```console
root@debian:~/my-ansible-6/final_test$ ansible-playbook test_file_content.yml
[WARNING]: You are running the development version of Ansible. You should only run Ansible from "devel" if you are
modifying the Ansible engine, or trying out features under development. This is a rapidly changing source of code and
can become unstable at any point.
[WARNING]: No inventory was parsed, only implicit localhost is available
[WARNING]: provided hosts list is empty, only localhost is available. Note that the implicit localhost does not match
'all'

PLAY [Test file content role] ******************************************************************************************

TASK [Gathering Facts] *************************************************************************************************
ok: [localhost]

TASK [test.utils.file_content : Compute file] **************************************************************************
changed: [localhost]

PLAY RECAP *************************************************************************************************************
localhost                  : ok=2    changed=1    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0

root@debian:~/my-ansible-6/final_test$ ls
test-utils-1.0.0.tar.gz  test_file  test_file_content.yml
root@debian:~/my-ansible-6/final_test$ cat test_file && echo ''
sequence_of_data
root@debian:~/my-ansible-6/final_test$
```

---

### 17. В ответ необходимо прислать ссылку на репозиторий с collection

Репозиторий **collection** [Ansible-Collection](https://github.com/NamorNinayzuk/ansible-collection)

---

## Необязательная часть

1. Реализуйте свой собственный модуль для создания хостов в Yandex Cloud.
2. Модуль может (и должен) иметь зависимость от `yc`, основной функционал: создание ВМ с нужным сайзингом на основе нужной ОС. Дополнительные модули по созданию кластеров Clickhouse, MySQL и прочего реализовывать не надо, достаточно простейшего создания ВМ.
3. Модуль может формировать динамическое inventory, но данная часть не является обязательной, достаточно, чтобы он делал хосты с указанной спецификацией в YAML.
4. Протестируйте модуль на идемпотентность, исполнимость. При успехе - добавьте данный модуль в свою коллекцию.
5. Измените playbook так, чтобы он умел создавать инфраструктуру под inventory, а после устанавливал весь ваш стек Observability на нужные хосты и настраивал его.
6. В итоге, ваша коллекция обязательно должна содержать: clickhouse-role(если есть своя), lighthouse-role, vector-role, два модуля: my_own_module и модуль управления Yandex Cloud хостами и playbook, который демонстрирует создание Observability стека.

---

### Как оформить ДЗ?

Выполненное домашнее задание пришлите ссылкой на .md-файл в вашем репозитории.

---
