# Домашнее задание к занятию "4. Работа с roles"

## Подготовка к выполнению
1. (Необязательно) Познакомтесь с [lighthouse](https://youtu.be/ymlrNlaHzIY?t=929)
2. Создайте два пустых публичных репозитория в любом своём проекте: vector-role и lighthouse-role.
3. Добавьте публичную часть своего ключа к своему профилю в github.

## Основная часть

Наша основная цель - разбить наш playbook на отдельные roles. Задача: сделать roles для clickhouse, vector и lighthouse и написать playbook для использования этих ролей. Ожидаемый результат: существуют три ваших репозитория: два с roles и один с playbook.

1. Создать в старой версии playbook файл `requirements.yml` и заполнить его следующим содержимым:

   ```yaml
   ---
     - src: git@github.com:AlexeySetevoi/ansible-clickhouse.git
       scm: git
       version: "1.11.0"
       name: clickhouse 
   ```

2. При помощи `ansible-galaxy` скачать себе эту роль.

Загрузка ролей выполняется командой: `ansible-galaxy install -r <файл>`, где `<файл>` - YAML файл с информацией о требуемых компонентах (ролях), включая информацию о способе их получения.

Если используемая роль уже загружена или её нужно обновить, то необходимо добавить ключ `--force`
```console
┌──(kali㉿kali)-[~/devops-netology8.4]
└─$ ansible-galaxy install -r requirements.yml                                       
Starting galaxy role install process
- extracting clickhouse to /home/kali/.ansible/roles/clickhouse
- clickhouse (1.11.0) was installed successfully
┌──(kali㉿kali)-[~/devops-netology8.4]
└─$ 
```
3. Создать новый каталог с ролью при помощи `ansible-galaxy role init vector-role`.

Для упрощения подготовки роли можно воспользоваться командой `ansible-galaxy role init <роль>`, где `<роль>` - имя инициализируемой роли.
Данная команда создаст шаблон новой роли, а именно - набор каталогов и предзаполненных файлов внутри директории `<роль>`.

Пример вывода команды:
```console
┌──(kali㉿kali)-[~/devops-netology8.4]
└─$ ansible-galaxy role init vector-role
- Role vector-role was created successfully                                                                                                                                                                                                                                        
┌──(kali㉿kali)-[~/devops-netology8.4]
└─$ ansible-galaxy role init lighthouse-role
- Role lighthouse-role was created successfully

```

4. На основе tasks из старого playbook заполните новую role. Разнесите переменные между `vars` и `default`.

В структуре каталогов роли переменные делятся на две группы: `defaults` и `vars`.
В **defaults** хранятся переменные и их значения по умолчанию, которые пользователь может переопределить на любом уровне (**group vars**, **host vars** и т.п.)
В **vars** хранятся переменные и их значения, которые обычно не предназначены для переопределения пользователем, а используются для упрощения дальнейшей разработки роли.
Исключение [--extra-vars](https://docs.ansible.com/ansible/latest/user_guide/playbooks_variables.html), которые при передаче в командной строке `ansible-playbook` могут их переопределить.

5. Перенести нужные шаблоны конфигов в `templates`.
6. Описать в `README.md` обе роли и их параметры.
7. Повторите шаги 3-6 для lighthouse. Помните, что одна роль должна настраивать один продукт.
8. Выложите все roles в репозитории. Проставьте тэги, используя семантическую нумерацию Добавьте roles в `requirements.yml` в playbook.
9. Переработайте playbook на использование roles. Не забудьте про зависимости lighthouse и возможности совмещения `roles` с `tasks`.
10. Выложите playbook в репозиторий.
11. В ответ приведите ссылки на оба репозитория с roles и одну ссылку на репозиторий с playbook.

---

### Как оформить ДЗ?

Выполненное домашнее задание пришлите ссылкой на .md-файл в вашем репозитории.

---
