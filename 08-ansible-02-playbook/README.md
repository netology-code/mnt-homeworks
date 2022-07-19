# Домашнее задание к занятию "08.02 Работа с Playbook"

## Подготовка к выполнению

1. (Необязательно) Изучите, что такое [clickhouse](https://www.youtube.com/watch?v=fjTNS2zkeBs) и [vector](https://www.youtube.com/watch?v=CgEhyffisLY)
2. Создайте свой собственный (или используйте старый) публичный репозиторий на github с произвольным именем.
3. Скачайте [playbook](./playbook/) из репозитория с домашним заданием и перенесите его в свой репозиторий.
4. Подготовьте хосты в соответствии с группами из предподготовленного playbook.

## Основная часть

1. Приготовьте свой собственный inventory файл `prod.yml`.
   * Создаем файл `inventory/prod.yml`
```shell
---
  local:
    hosts:
      localhost:
        ansible_connection: ssh
  docker:
    hosts:
      ubuntu:
        ansible_connection: docker
      centos7:
        ansible_connection: docker
      fedora:
        ansible_connection: docker
```
2. Допишите playbook: нужно сделать ещё один play, который устанавливает и настраивает [vector](https://vector.dev).
    * Добавляем play для vector
```shell

```
3. При создании tasks рекомендую использовать модули: `get_url`, `template`, `unarchive`, `file`.
4. Tasks должны: скачать нужной версии дистрибутив, выполнить распаковку в выбранную директорию, установить vector.
5. Запустите `ansible-lint site.yml` и исправьте ошибки, если они есть.
   * Ошибки выводимые `ansible-lint` устранены:
```shell
dpopov@dpopov-test:~/mnt-hwk/playbook$ ansible-lint -vvv site.yml
DEBUG    Logging initialized to level 10
DEBUG    Options: Namespace(listrules=False, format='rich', quiet=False, parseable=False, parseable_severity=False, progressive=False, rulesdir=[], use_default_rules=False, display_relative_path=True, tags=[], listtags=False, verbosity=3, skip_list=[], warn_list=[], colored=True, exclude_paths=[], config_file=None, playbook=['site.yml'])
DEBUG    Loading rules from /usr/lib/python3/dist-packages/ansiblelint/rules
DEBUG    Examining site.yml of type playbook

```
6. Попробуйте запустить playbook на этом окружении с флагом `--check`.
   * Запуск плейбука с флагом `--check` дает следующий вывод, который не влияет на его выполнение на 
```shell
dpopov@dpopov-test:~/mnt-hwk/playbook$ sudo ansible-playbook -i inventory/prod.yml site.yml --check

PLAY [all] ***************************************************************************************************************************************************************

TASK [Check for Python] **************************************************************************************************************************************************
skipping: [clickhouse-01]

TASK [Install Python] ****************************************************************************************************************************************************
fatal: [clickhouse-01]: FAILED! => {"msg": "The conditional check 'check_python.rc != 0' failed. The error was: error while evaluating conditional (check_python.rc != 0): 'dict object' has no attribute 'rc'\n\nThe error appears to be in '/home/dpopov/mnt-hwk/playbook/site.yml': line 12, column 5, but may\nbe elsewhere in the file depending on the exact syntax problem.\n\nThe offending line appears to be:\n\n\n  - name: Install Python\n    ^ here\n"}

PLAY RECAP ***************************************************************************************************************************************************************
clickhouse-01              : ok=0    changed=0    unreachable=0    failed=1    skipped=1    rescued=0    ignored=0

```
7. Запустите playbook на `prod.yml` окружении с флагом `--diff`. Убедитесь, что изменения на системе произведены.
   * Запуск с флагом `--diff` дает следующий [вывод](files/diff.md):
8. Повторно запустите playbook с флагом `--diff` и убедитесь, что playbook идемпотентен.
   * Повторный запуск playbook с флагом `--diff` [свидетельствует](files/diff2.md) об иденпотентности конфигурации
9. Подготовьте README.md файл по своему playbook. В нём должно быть описано: что делает playbook, какие у него есть параметры и теги.
   * Мой [playbook](https://github.com/rowhe/mnt-hwk/blob/418f2b324d65412050623d56ea99efb0b3599a03/playbook/site.yml) для установки clickhouse+vector и его описание в файле [README.md](https://github.com/rowhe/mnt-hwk/blob/418f2b324d65412050623d56ea99efb0b3599a03/README.md)
   
10. Готовый playbook выложите в свой репозиторий, поставьте тег `08-ansible-02-playbook` на фиксирующий коммит, в ответ предоставьте ссылку на него.

---

### Как оформить ДЗ?

Выполненное домашнее задание пришлите ссылкой на .md-файл в вашем репозитории.

---
