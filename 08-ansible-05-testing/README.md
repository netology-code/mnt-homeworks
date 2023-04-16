# Домашнее задание к занятию "5. Тестирование roles"

## Подготовка к выполнению
> 1. Установите molecule: `pip3 install "molecule==3.5.2"`
> 2. Выполните `docker pull aragast/netology:latest` -  это образ с podman, tox и несколькими пайтонами (3.7 и 3.9) внутри

## Основная часть

Наша основная цель - настроить тестирование наших ролей. Задача: сделать сценарии тестирования для vector. Ожидаемый результат: все сценарии успешно проходят тестирование ролей.

### Molecule

### 1. Запустите  `molecule test -s centos_7` внутри корневой директории clickhouse-role, посмотрите на вывод команды.

Используемое окружение:
![system schema](https://i.imgur.com/AdLOUeg.png)


Для работы потребуется наличие пакета **flake8** (установка, например для **apt**: `sudo apt install flake8`).
А также существует несовместимость контейнеризации если установлен **Podman** в качестве хоста **Docker**, которую нужно учесть.

Разбор вывода теста <b>molecule</b>... Часть лога:

```console
┌──(kali㉿kali)-[~/08-ansible-05/clickhouse]
└─$ molecule test -s centos_7
INFO     centos_7 scenario test matrix: dependency, lint, cleanup, destroy, syntax, create, prepare, converge, idempotence, side_effect, verify, cleanup, destroy
INFO     Performing prerun...
INFO     Set ANSIBLE_LIBRARY=/home/.cache/ansible-compat/b9a93c/modules:/home/.ansible/plugins/modules:/usr/share/ansible/plugins/modules
INFO     Set ANSIBLE_COLLECTIONS_PATH=/home/.cache/ansible-compat/b9a93c/../home/.ansible:/usr/share/ansible
INFO     Set ANSIBLE_ROLES_PATH=/home/.cache/ansible-compat/b9a93c/roles:/home/.ansible/roles:/usr/share/ansible/roles:/etc/ansible/roles
INFO     Inventory /home/08-ansible-05/ansible-clickhouse/molecule/centos_7/../resources/inventory/hosts.yml linked to /home/.cache/molecule/ansible-clickhouse/centos_7/inventory/hosts
INFO     Inventory /home/08-ansible-05/ansible-clickhouse/molecule/centos_7/../resources/inventory/group_vars/ linked to /home/.cache/molecule/ansible-clickhouse/centos_7/inventory/group_vars
INFO     Inventory /home/08-ansible-05/ansible-clickhouse/molecule/centos_7/../resources/inventory/host_vars/ linked to /home/.cache/molecule/ansible-clickhouse/centos_7/inventory/host_vars
INFO     Running centos_7 > dependency
WARNING  Skipping, missing the requirements file.
WARNING  Skipping, missing the requirements file.
INFO     Inventory /home/08-ansible-05/ansible-clickhouse/molecule/centos_7/../resources/inventory/hosts.yml linked to /home/.cache/molecule/ansible-clickhouse/centos_7/inventory/hosts
INFO     Inventory /home/08-ansible-05/ansible-clickhouse/molecule/centos_7/../resources/inventory/group_vars/ linked to /home/.cache/molecule/ansible-clickhouse/centos_7/inventory/group_vars
INFO     Inventory /home/08-ansible-05/ansible-clickhouse/molecule/centos_7/../resources/inventory/host_vars/ linked to /home/.cache/molecule/ansible-clickhouse/centos_7/inventory/host_vars
INFO     Running centos_7 > lint
COMMAND: yamllint .
ansible-lint
flake8

WARNING  Listing 56 violation(s) that are fatal
fqcn-builtins: Use FQCN for builtin actions.
handlers/main.yml:3 Task/Handler: Restart Clickhouse Service

schema: {'name': 'EL', 'versions': [7, 8]} is not valid under any of the given schemas (schema[meta])
meta/main.yml:1  Returned errors will not include exact line numbers, but they will mention
the schema name being used as a tag, like ``playbook-schema``,
``tasks-schema``.

This rule is not skippable and stops further processing of the file.

Schema bugs should be reported towards (https://github.com/ansible/schemas) project instead of ansible-lint.

If incorrect schema was picked, you might want to either:

* move the file to standard location, so its file is detected correctly.
* use ``kinds:`` option in linter config to help it pick correct file type.


fqcn-builtins: Use FQCN for builtin actions.
molecule/centos_7/converge.yml:5 Task/Handler: Include ansible-clickhouse

fqcn-builtins: Use FQCN for builtin actions.
molecule/centos_7/verify.yml:8 Task/Handler: Example assertion

fqcn-builtins: Use FQCN for builtin actions.
molecule/centos_8/converge.yml:5 Task/Handler: Include ansible-clickhouse

fqcn-builtins: Use FQCN for builtin actions.
molecule/centos_8/verify.yml:8 Task/Handler: Example assertion

schema: None is not of type 'object' (schema[inventory])
molecule/resources/inventory/hosts.yml:1  Returned errors will not include exact line numbers, but they will mention
the schema name being used as a tag, like ``playbook-schema``,
``tasks-schema``.

This rule is not skippable and stops further processing of the file.

Schema bugs should be reported towards (https://github.com/ansible/schemas) project instead of ansible-lint.

If incorrect schema was picked, you might want to either:

* move the file to standard location, so its file is detected correctly.
* use ``kinds:`` option in linter config to help it pick correct file type.


fqcn-builtins: Use FQCN for builtin actions.
molecule/resources/playbooks/converge.yml:5 Task/Handler: Apply Clickhouse Role

fqcn-builtins: Use FQCN for builtin actions.
molecule/ubuntu_focal/converge.yml:5 Task/Handler: Include ansible-clickhouse

fqcn-builtins: Use FQCN for builtin actions.
molecule/ubuntu_focal/verify.yml:8 Task/Handler: Example assertion

fqcn-builtins: Use FQCN for builtin actions.
tasks/configure/db.yml:2 Task/Handler: Set ClickHose Connection String

fqcn-builtins: Use FQCN for builtin actions.
tasks/configure/db.yml:5 Task/Handler: Gather list of existing databases

fqcn-builtins: Use FQCN for builtin actions.
tasks/configure/db.yml:11 Task/Handler: Config | Delete database config

fqcn-builtins: Use FQCN for builtin actions.
tasks/configure/db.yml:20 Task/Handler: Config | Create database config

fqcn-builtins: Use FQCN for builtin actions.
tasks/configure/dict.yml:2 Task/Handler: Config | Generate dictionary config

fqcn-builtins: Use FQCN for builtin actions.
tasks/configure/sys.yml:2 Task/Handler: Check clickhouse config, data and logs

fqcn-builtins: Use FQCN for builtin actions.
tasks/configure/sys.yml:17 Task/Handler: Config | Create config.d folder

fqcn-builtins: Use FQCN for builtin actions.
tasks/configure/sys.yml:26 Task/Handler: Config | Create users.d folder

fqcn-builtins: Use FQCN for builtin actions.
tasks/configure/sys.yml:35 Task/Handler: Config | Generate system config

fqcn-builtins: Use FQCN for builtin actions.
tasks/configure/sys.yml:45 Task/Handler: Config | Generate users config

fqcn-builtins: Use FQCN for builtin actions.
tasks/configure/sys.yml:54 Task/Handler: Config | Generate remote_servers config

fqcn-builtins: Use FQCN for builtin actions.
tasks/configure/sys.yml:65 Task/Handler: Config | Generate macros config

fqcn-builtins: Use FQCN for builtin actions.
tasks/configure/sys.yml:76 Task/Handler: Config | Generate zookeeper servers config

fqcn-builtins: Use FQCN for builtin actions.
tasks/configure/sys.yml:87 Task/Handler: Config | Fix interserver_http_port and intersever_https_port collision

fqcn-builtins: Use FQCN for builtin actions.
tasks/install/apt.yml:5 Task/Handler: Install by APT | Apt-key add repo key

fqcn-builtins: Use FQCN for builtin actions.
tasks/install/apt.yml:12 Task/Handler: Install by APT | Remove old repo

fqcn-builtins: Use FQCN for builtin actions.
tasks/install/apt.yml:20 Task/Handler: Install by APT | Repo installation

fqcn-builtins: Use FQCN for builtin actions.
tasks/install/apt.yml:27 Task/Handler: Install by APT | Package installation

fqcn-builtins: Use FQCN for builtin actions.
tasks/install/apt.yml:36 Task/Handler: Install by APT | Package installation

fqcn-builtins: Use FQCN for builtin actions.
tasks/install/apt.yml:45 Task/Handler: Hold specified version during APT upgrade | Package installation

risky-file-permissions: File permissions unset or incorrect.
tasks/install/apt.yml:45 Task/Handler: Hold specified version during APT upgrade | Package installation

fqcn-builtins: Use FQCN for builtin actions.
tasks/install/dnf.yml:5 Task/Handler: Install by YUM | Ensure clickhouse repo GPG key imported

fqcn-builtins: Use FQCN for builtin actions.
tasks/install/dnf.yml:12 Task/Handler: Install by YUM | Ensure clickhouse repo installed

fqcn-builtins: Use FQCN for builtin actions.
tasks/install/dnf.yml:24 Task/Handler: Install by YUM | Ensure clickhouse package installed (latest)

fqcn-builtins: Use FQCN for builtin actions.
tasks/install/dnf.yml:32 Task/Handler: Install by YUM | Ensure clickhouse package installed (version {{ clickhouse_version }})

fqcn-builtins: Use FQCN for builtin actions.
tasks/install/yum.yml:5 Task/Handler: Install by YUM | Ensure clickhouse repo installed

fqcn-builtins: Use FQCN for builtin actions.
tasks/install/yum.yml:16 Task/Handler: Install by YUM | Ensure clickhouse package installed (latest)

fqcn-builtins: Use FQCN for builtin actions.
tasks/install/yum.yml:24 Task/Handler: Install by YUM | Ensure clickhouse package installed (version {{ clickhouse_version }})

fqcn-builtins: Use FQCN for builtin actions.
tasks/main.yml:3 Task/Handler: Include OS Family Specific Variables

fqcn-builtins: Use FQCN for builtin actions.
tasks/main.yml:39 Task/Handler: Notify Handlers Now

fqcn-builtins: Use FQCN for builtin actions.
tasks/main.yml:45 Task/Handler: Wait for Clickhouse Server to Become Ready

fqcn-builtins: Use FQCN for builtin actions.
tasks/params.yml:3 Task/Handler: Set clickhouse_service_enable

fqcn-builtins: Use FQCN for builtin actions.
tasks/params.yml:7 Task/Handler: Set clickhouse_service_ensure

fqcn-builtins: Use FQCN for builtin actions.
tasks/precheck.yml:1 Task/Handler: Requirements check | Checking sse4_2 support

fqcn-builtins: Use FQCN for builtin actions.
tasks/precheck.yml:5 Task/Handler: Requirements check | Not supported distribution && release

fqcn-builtins: Use FQCN for builtin actions.
tasks/remove.yml:3 Task/Handler: Remove clickhouse config,data and logs

fqcn-builtins: Use FQCN for builtin actions.
tasks/remove/apt.yml:5 Task/Handler: Uninstall by APT | Package uninstallation

fqcn-builtins: Use FQCN for builtin actions.
tasks/remove/apt.yml:12 Task/Handler: Uninstall by APT | Repo uninstallation

fqcn-builtins: Use FQCN for builtin actions.
tasks/remove/apt.yml:18 Task/Handler: Uninstall by APT | Apt-key remove repo key

fqcn-builtins: Use FQCN for builtin actions.
tasks/remove/dnf.yml:5 Task/Handler: Uninstall by YUM | Ensure clickhouse package uninstalled

fqcn-builtins: Use FQCN for builtin actions.
tasks/remove/dnf.yml:12 Task/Handler: Uninstall by YUM | Ensure clickhouse repo uninstalled

fqcn-builtins: Use FQCN for builtin actions.
tasks/remove/dnf.yml:19 Task/Handler: Uninstall by YUM | Ensure clickhouse key uninstalled

fqcn-builtins: Use FQCN for builtin actions.
tasks/remove/yum.yml:5 Task/Handler: Uninstall by YUM | Ensure clickhouse package uninstalled

fqcn-builtins: Use FQCN for builtin actions.
tasks/remove/yum.yml:12 Task/Handler: Uninstall by YUM | Ensure clickhouse repo uninstalled

fqcn-builtins: Use FQCN for builtin actions.
tasks/service.yml:3 Task/Handler: Ensure {{ clickhouse_service }} is enabled: {{ clickhouse_service_enable }} and state: {{ clickhouse_service_ensure }}

var-spacing: Jinja2 variables and filters should have spaces before and after.
vars/debian.yml:4 .clickhouse_repo_old

You can skip specific rules or tags by adding them to your configuration file:
# .config/ansible-lint.yml
warn_list:  # or 'skip_list' to silence them completely
  - experimental  # all rules tagged as experimental
  - fqcn-builtins  # Use FQCN for builtin actions.
  - var-spacing  # Jinja2 variables and filters should have spaces before and after.

Finished with 53 failure(s), 3 warning(s) on 56 files.
INFO     Inventory /home/08-ansible-05/ansible-clickhouse/molecule/centos_7/../resources/inventory/hosts.yml linked to
 /home/.cache/molecule/ansible-clickhouse/centos_7/inventory/hosts
INFO     Inventory /home/08-ansible-05/ansible-clickhouse/molecule/centos_7/../resources/inventory/group_vars/ linked to /home/.cache/molecule/ansible-clickhouse/centos_7/inventory/group_vars
INFO     Inventory /home/08-ansible-05/ansible-clickhouse/molecule/centos_7/../resources/inventory/host_vars/ linked to /home/.cache/molecule/ansible-clickhouse/centos_7/inventory/host_vars
INFO     Running centos_7 > cleanup
WARNING  Skipping, cleanup playbook not configured.
INFO     Inventory /home/08-ansible-05/ansible-clickhouse/molecule/centos_7/../resources/inventory/hosts.yml linked to
 /home/.cache/molecule/ansible-clickhouse/centos_7/inventory/hosts
INFO     Inventory /home/08-ansible-05/ansible-clickhouse/molecule/centos_7/../resources/inventory/group_vars/ linked to /home/.cache/molecule/ansible-clickhouse/centos_7/inventory/group_vars
INFO     Inventory /home/08-ansible-05/ansible-clickhouse/molecule/centos_7/../resources/inventory/host_vars/ linked to /home/.cache/molecule/ansible-clickhouse/centos_7/inventory/host_vars
INFO     Running centos_7 > destroy
INFO     Sanity checks: 'docker'

PLAY [Destroy] *****************************************************************

TASK [Destroy molecule instance(s)] ********************************************
changed: [localhost] => (item=centos_7)

TASK [Wait for instance(s) deletion to complete] *******************************
ok: [localhost] => (item=centos_7)

TASK [Delete docker networks(s)] ***********************************************

PLAY RECAP *********************************************************************
localhost                  : ok=2    changed=1    unreachable=0    failed=0    skipped=1    rescued=0    ignored=0

INFO     Inventory /home/08-ansible-05/ansible-clickhouse/molecule/centos_7/../resources/inventory/hosts.yml linked to
 /home/.cache/molecule/ansible-clickhouse/centos_7/inventory/hosts
INFO     Inventory /home/08-ansible-05/ansible-clickhouse/molecule/centos_7/../resources/inventory/group_vars/ linked to /home/.cache/molecule/ansible-clickhouse/centos_7/inventory/group_vars
INFO     Inventory /home/08-ansible-05/ansible-clickhouse/molecule/centos_7/../resources/inventory/host_vars/ linked to /home/.cache/molecule/ansible-clickhouse/centos_7/inventory/host_vars
INFO     Running centos_7 > syntax

playbook: /home/08-ansible-05/ansible-clickhouse/molecule/resources/playbooks/converge.yml
INFO     Inventory /home/08-ansible-05/ansible-clickhouse/molecule/centos_7/../resources/inventory/hosts.yml linked to
 /home/.cache/molecule/ansible-clickhouse/centos_7/inventory/hosts
INFO     Inventory /home/08-ansible-05/ansible-clickhouse/molecule/centos_7/../resources/inventory/group_vars/ linked to /home/.cache/molecule/ansible-clickhouse/centos_7/inventory/group_vars
INFO     Inventory /home/08-ansible-05/ansible-clickhouse/molecule/centos_7/../resources/inventory/host_vars/ linked to /home/.cache/molecule/ansible-clickhouse/centos_7/inventory/host_vars
INFO     Running centos_7 > create

PLAY [Create] ******************************************************************

TASK [Log into a Docker registry] **********************************************
skipping: [localhost] => (item=None)
skipping: [localhost]

TASK [Check presence of custom Dockerfiles] ************************************
ok: [localhost] => (item={'capabilities': ['SYS_ADMIN'], 'command': '/usr/sbin/init', 'dockerfile': '../resources/Dockerfile.j2', 'env': {'ANSIBLE_USER': 'ansible', 'DEPLOY_GROUP': 'deployer', 'SUDO_GROUP': 'wheel', 'container': 'docker'}, 'image': 'centos:7', 'name': 'centos_7', 'privileged': True, 'tmpfs': ['/run', '/tmp'], 'volumes': ['/sys/fs/cgroup:/sys/fs/cgroup']})

TASK [Create Dockerfiles from image names] *************************************
changed: [localhost] => (item={'capabilities': ['SYS_ADMIN'], 'command': '/usr/sbin/init', 'dockerfile': '../resources/Dockerfile.j2', 'env': {'ANSIBLE_USER': 'ansible', 'DEPLOY_GROUP': 'deployer', 'SUDO_GROUP': 'wheel', 'container': 'docker'}, 'image': 'centos:7', 'name': 'centos_7', 'privileged': True, 'tmpfs': ['/run', '/tmp'], 'volumes': ['/sys/fs/cgroup:/sys/fs/cgroup']})

TASK [Discover local Docker images] ********************************************
ok: [localhost] => (item={'diff': [], 'dest': '/home/.cache/molecule/ansible-clickhouse/centos_7/Dockerfile_centos_7', 'src': '/home/.ansible/tmp/ansible-tmp-1659784396.3046184-3873-95148761793267/source', 'md5sum': 'e90d08cd34f49a5f8a41a07de1348618', 'checksum': '4b70768619482424811f2977aa277a5acf2b13a1', 'changed': True, 'uid': 1000, 'gid': 1000, 'owner': 'sa', 'group': 'sa', 'mode': '0600', 'state': 'file', 'size': 2199, 'invocation': {'module_args': {'src': '/home/.ansible/tmp/ansible-tmp-1659784396.3046184-3873-95148761793267/source', 'dest': '/home/.cache/molecule/ansible-clickhouse/centos_7/Dockerfile_centos_7', 'mode': '0600', 'follow': False, '_original_basename': 'Dockerfile.j2', 'checksum': '4b70768619482424811f2977aa277a5acf2b13a1', 'backup': False, 'force': True, 'unsafe_writes': False, 'content': None, 'validate': None, 'directory_mode': None, 'remote_src': None, 'local_follow': None, 'owner': None, 'group': None, 'seuser': None, 'serole': None, 'selevel': None, 'setype': None, 'attributes': None}}, 'failed': False, 'item': {'capabilities': ['SYS_ADMIN'], 'command': '/usr/sbin/init', 'dockerfile': '../resources/Dockerfile.j2', 'env': {'ANSIBLE_USER': 'ansible', 'DEPLOY_GROUP': 'deployer', 'SUDO_GROUP': 'wheel', 'container': 'docker'}, 'image': 'centos:7', 'name': 'centos_7', 'privileged': True, 'tmpfs': ['/run', '/tmp'], 'volumes': ['/sys/fs/cgroup:/sys/fs/cgroup']}, 'ansible_loop_var': 'item', 'i': 0, 'ansible_index_var': 'i'})

TASK [Build an Ansible compatible image (new)] *********************************
changed: [localhost] => (item=molecule_local/centos:7)

TASK [Create docker network(s)] ************************************************

TASK [Determine the CMD directives] ********************************************
ok: [localhost] => (item={'capabilities': ['SYS_ADMIN'], 'command': '/usr/sbin/init', 'dockerfile': '../resources/Dockerfile.j2', 'env': {'ANSIBLE_USER': 'ansible', 'DEPLOY_GROUP': 'deployer', 'SUDO_GROUP': 'wheel', 'container': 'docker'}, 'image': 'centos:7', 'name': 'centos_7', 'privileged': True, 'tmpfs': ['/run', '/tmp'], 'volumes': ['/sys/fs/cgroup:/sys/fs/cgroup']})

TASK [Create molecule instance(s)] *********************************************
changed: [localhost] => (item=centos_7)

TASK [Wait for instance(s) creation to complete] *******************************
FAILED - RETRYING: [localhost]: Wait for instance(s) creation to complete (300 retries left).
changed: [localhost] => (item={'failed': 0, 'started': 1, 'finished': 0, 'ansible_job_id': '478592296224.4738', 'results_file': '/home/.ansible_async/478592296224.4738', 'changed': True, 'item': {'capabilities': ['SYS_ADMIN'], 'command': '/usr/sbin/init', 'dockerfile': '../resources/Dockerfile.j2', 'env': {'ANSIBLE_USER': 'ansible', 'DEPLOY_GROUP': 'deployer', 'SUDO_GROUP': 'wheel', 'container': 'docker'}, 'image': 'centos:7', 'name': 'centos_7', 'privileged': True, 'tmpfs': ['/run', '/tmp'], 'volumes': ['/sys/fs/cgroup:/sys/fs/cgroup']}, 'ansible_loop_var': 'item'})

PLAY RECAP *********************************************************************
localhost                  : ok=7    changed=4    unreachable=0    failed=0    skipped=2    rescued=0    ignored=0

INFO     Inventory /home/08-ansible-05/ansible-clickhouse/molecule/centos_7/../resources/inventory/hosts.yml linked to
 /home/.cache/molecule/ansible-clickhouse/centos_7/inventory/hosts
INFO     Inventory /home/08-ansible-05/ansible-clickhouse/molecule/centos_7/../resources/inventory/group_vars/ linked to /home/.cache/molecule/ansible-clickhouse/centos_7/inventory/group_vars
INFO     Inventory /home/08-ansible-05/ansible-clickhouse/molecule/centos_7/../resources/inventory/host_vars/ linked to /home/.cache/molecule/ansible-clickhouse/centos_7/inventory/host_vars
INFO     Running centos_7 > prepare
WARNING  Skipping, prepare playbook not configured.
INFO     Inventory /home/08-ansible-05/ansible-clickhouse/molecule/centos_7/../resources/inventory/hosts.yml linked to
 /home/.cache/molecule/ansible-clickhouse/centos_7/inventory/hosts
INFO     Inventory /home/08-ansible-05/ansible-clickhouse/molecule/centos_7/../resources/inventory/group_vars/ linked to /home/.cache/molecule/ansible-clickhouse/centos_7/inventory/group_vars
INFO     Inventory /home/08-ansible-05/ansible-clickhouse/molecule/centos_7/../resources/inventory/host_vars/ linked to /home/.cache/molecule/ansible-clickhouse/centos_7/inventory/host_vars
INFO     Running centos_7 > converge

PLAY [Converge] ****************************************************************

TASK [Gathering Facts] *********************************************************
ok: [centos_7]

TASK [Apply Clickhouse Role] ***************************************************

TASK [ansible-clickhouse : Include OS Family Specific Variables] ***************
ok: [centos_7]

TASK [ansible-clickhouse : include_tasks] **************************************
included: /home/08-ansible-05/ansible-clickhouse/tasks/precheck.yml for centos_7

TASK [ansible-clickhouse : Requirements check | Checking sse4_2 support] *******
ok: [centos_7]

TASK [ansible-clickhouse : Requirements check | Not supported distribution && release] ***
skipping: [centos_7]

TASK [ansible-clickhouse : include_tasks] **************************************
included: /home/08-ansible-05/ansible-clickhouse/tasks/params.yml for centos_7

TASK [ansible-clickhouse : Set clickhouse_service_enable] **********************
ok: [centos_7]

TASK [ansible-clickhouse : Set clickhouse_service_ensure] **********************
ok: [centos_7]

TASK [ansible-clickhouse : include_tasks] **************************************
included: /home/08-ansible-05/ansible-clickhouse/tasks/install/yum.yml for centos_7

TASK [ansible-clickhouse : Install by YUM | Ensure clickhouse repo installed] ***
--- before: /etc/yum.repos.d/clickhouse.repo
+++ after: /etc/yum.repos.d/clickhouse.repo
@@ -0,0 +1,7 @@
+[clickhouse]
+async = 1
+baseurl = https://packages.clickhouse.com/rpm/stable/
+enabled = 1
+gpgcheck = 0
+name = Clickhouse repo
+

changed: [centos_7]

TASK [ansible-clickhouse : Install by YUM | Ensure clickhouse package installed (latest)] ***
changed: [centos_7]

TASK [ansible-clickhouse : Install by YUM | Ensure clickhouse package installed (version latest)] ***
skipping: [centos_7]

TASK [ansible-clickhouse : include_tasks] **************************************
included: /home/08-ansible-05/ansible-clickhouse/tasks/configure/sys.yml for centos_7

TASK [ansible-clickhouse : Check clickhouse config, data and logs] *************
ok: [centos_7] => (item=/var/log/clickhouse-server)
--- before
+++ after
@@ -1,4 +1,4 @@
 {
-    "mode": "0700",
+    "mode": "0770",
     "path": "/etc/clickhouse-server"
 }

changed: [centos_7] => (item=/etc/clickhouse-server)
--- before
+++ after
@@ -1,7 +1,7 @@
 {
-    "group": 0,
-    "mode": "0755",
-    "owner": 0,
+    "group": 996,
+    "mode": "0770",
+    "owner": 999,
     "path": "/var/lib/clickhouse/tmp/",
-    "state": "absent"
+    "state": "directory"
 }

changed: [centos_7] => (item=/var/lib/clickhouse/tmp/)
--- before
+++ after
@@ -1,4 +1,4 @@
 {
-    "mode": "0700",
+    "mode": "0770",
     "path": "/var/lib/clickhouse/"
 }

changed: [centos_7] => (item=/var/lib/clickhouse/)

TASK [ansible-clickhouse : Config | Create config.d folder] ********************
--- before
+++ after
@@ -1,4 +1,4 @@
 {
-    "mode": "0500",
+    "mode": "0770",
     "path": "/etc/clickhouse-server/config.d"
 }

changed: [centos_7]

TASK [ansible-clickhouse : Config | Create users.d folder] *********************
--- before
+++ after
@@ -1,4 +1,4 @@
 {
-    "mode": "0500",
+    "mode": "0770",
     "path": "/etc/clickhouse-server/users.d"
 }

changed: [centos_7]

TASK [ansible-clickhouse : Config | Generate system config] ********************
--- before
+++ after: /home/.ansible/tmp/ansible-local-4875ocmz5_ty/tmpdefjsh_1/config.j2
@@ -0,0 +1,382 @@
+<?xml version="1.0"?>
+<!--
+ -
+ - Ansible managed: Do NOT edit this file manually!
+ -
+-->
+<clickhouse>
+    <logger>
+        <!-- Possible levels: https://github.com/pocoproject/poco/blob/develop/Foundation/include/Poco/Logger.h#L105 -->
+        <level>trace</level>
+        <log>/var/log/clickhouse-server/clickhouse-server.log</log>
+        <errorlog>/var/log/clickhouse-server/clickhouse-server.err.log</errorlog>
+        <size>1000M</size>
+        <count>10</count>
+    </logger>
+
+    <http_port>8123</http_port>
+
+    <tcp_port>9000</tcp_port>
+
+    <!-- Used with https_port and tcp_port_secure. Full ssl options list: https://github.com/ClickHouse-Extras/poco/blob/master/NetSSL_OpenSSL/include/Poco/Net/SSLManager.h#L71 -->
+    <openSSL>
+        <server> <!-- Used for https server AND secure tcp port -->
+            <!-- openssl req -subj "/CN=localhost" -new -newkey rsa:2048 -days 365 -nodes -x509 -keyout /etc/clickhouse-server/server.key -out /etc/clickhouse-server/server.crt -->
+            <certificateFile>/etc/clickhouse-server/server.crt</certificateFile>
+            <privateKeyFile>/etc/clickhouse-server/server.key</privateKeyFile>
+            <!-- openssl dhparam -out /etc/clickhouse-server/dhparam.pem 4096 -->
+            <dhParamsFile>/etc/clickhouse-server/dhparam.pem</dhParamsFile>
+            <verificationMode>none</verificationMode>
+            <loadDefaultCAFile>true</loadDefaultCAFile>
+            <cacheSessions>true</cacheSessions>
+            <disableProtocols>sslv2,sslv3</disableProtocols>
+            <preferServerCiphers>true</preferServerCiphers>
+        </server>
+
+        <client> <!-- Used for connecting to https dictionary source -->
+            <loadDefaultCAFile>true</loadDefaultCAFile>
+            <cacheSessions>true</cacheSessions>
+            <disableProtocols>sslv2,sslv3</disableProtocols>
+            <preferServerCiphers>true</preferServerCiphers>
+            <!-- Use for self-signed: <verificationMode>none</verificationMode> -->
+            <invalidCertificateHandler>
+                <!-- Use for self-signed: <name>AcceptCertificateHandler</name> -->
+                <name>RejectCertificateHandler</name>
+            </invalidCertificateHandler>
+        </client>
+    </openSSL>
+
+    <!-- Default root page on http[s] server. For example load UI from https://tabix.io/ when opening http://localhost:8123 -->
+    <!--
+    <http_server_default_response><![CDATA[<html ng-app="SMI2"><head><base href="http://ui.tabix.io/"></head><body><div ui-view="" class="content-ui"></div><script src="http://loader.tabix.io/master.js"></script></body></html>]]></http_server_default_response>
+    -->
+
+    <!-- Port for communication between replicas. Used for data exchange. -->
+    <interserver_http_port>9009</interserver_http_port>
+
+
+
+    <!-- Hostname that is used by other replicas to request this server.
+         If not specified, than it is determined analoguous to 'hostname -f' command.
+         This setting could be used to switch replication to another network interface.
+      -->
+    <!--
+    <interserver_http_host>example.clickhouse.com</interserver_http_host>
+    -->
+
+    <!-- Listen specified host. use :: (wildcard IPv6 address), if you want to accept connections both with IPv4 and IPv6 from everywhere. -->
+    <!-- <listen_host>::</listen_host> -->
+    <!-- Same for hosts with disabled ipv6: -->
+    <!-- <listen_host>0.0.0.0</listen_host> -->
+    <listen_host>127.0.0.1</listen_host>
+
+    <max_connections>2048</max_connections>
+    <keep_alive_timeout>3</keep_alive_timeout>
+
+    <!-- Maximum number of concurrent queries. -->
+    <max_concurrent_queries>100</max_concurrent_queries>
+
+    <!-- Set limit on number of open files (default: maximum). This setting makes sense on Mac OS X because getrlimit() fails to retrieve
+         correct maximum value. -->
+    <!-- <max_open_files>262144</max_open_files> -->
+
+    <!-- Size of cache of uncompressed blocks of data, used in tables of MergeTree family.
+         In bytes. Cache is single for server. Memory is allocated only on demand.
+         Cache is used when 'use_uncompressed_cache' user setting turned on (off by default).
+         Uncompressed cache is advantageous only for very short queries and in rare cases.
+      -->
+    <uncompressed_cache_size>8589934592</uncompressed_cache_size>
+
+    <!-- Approximate size of mark cache, used in tables of MergeTree family.
+         In bytes. Cache is single for server. Memory is allocated only on demand.
+         You should not lower this value.
+      -->
+    <mark_cache_size>5368709120</mark_cache_size>
+
+
+    <!-- Path to data directory, with trailing slash. -->
+    <path>/var/lib/clickhouse/</path>
+
+    <!-- Path to temporary data for processing hard queries. -->
+    <tmp_path>/var/lib/clickhouse/tmp/</tmp_path>
+
+    <!-- Directory with user provided files that are accessible by 'file' table function. -->
+    <user_files_path>/var/lib/clickhouse/user_files/</user_files_path>
+
+    <!-- Path to configuration file with users, access rights, profiles of settings, quotas. -->
+    <users_config>users.xml</users_config>
+
+    <!-- Default profile of settings. -->
+    <default_profile>default</default_profile>
+
+    <!-- System profile of settings. This settings are used by internal processes (Buffer storage, Distibuted DDL worker and so on). -->
+    <!-- <system_profile>default</system_profile> -->
+
+    <!-- Default database. -->
+    <default_database>default</default_database>
+
+    <!-- Server time zone could be set here.
+
+         Time zone is used when converting between String and DateTime types,
+          when printing DateTime in text formats and parsing DateTime from text,
+          it is used in date and time related functions, if specific time zone was not passed as an argument.
+
+         Time zone is specified as identifier from IANA time zone database, like UTC or Africa/Abidjan.
+         If not specified, system time zone at server startup is used.
+
+         Please note, that server could display time zone alias instead of specified name.
+         Example: W-SU is an alias for Europe/Moscow and Zulu is an alias for UTC.
+    -->
+    <!-- <timezone>Europe/Moscow</timezone> -->
+
+    <!-- You can specify umask here (see "man umask"). Server will apply it on startup.
+         Number is always parsed as octal. Default umask is 027 (other users cannot read logs, data files, etc; group can only read).
+    -->
+    <!-- <umask>022</umask> -->
+
+    <!-- Perform mlockall after startup to lower first queries latency
+          and to prevent clickhouse executable from being paged out under high IO load.
+         Enabling this option is recommended but will lead to increased startup time for up to a few seconds.
+    -->
+    <mlock_executable>False</mlock_executable>
+
+    <!-- Configuration of clusters that could be used in Distributed tables.
+         https://clickhouse.com/docs/en/engines/table-engines/special/distributed/
+      -->
+    <remote_servers incl="clickhouse_remote_servers" />
+
+
+    <!-- If element has 'incl' attribute, then for it's value will be used corresponding substitution from another file.
+         By default, path to file with substitutions is /etc/metrika.xml. It could be changed in config in 'include_from' element.
+         Values for substitutions are specified in /clickhouse/name_of_substitution elements in that file.
+      -->
+
+    <!-- ZooKeeper is used to store metadata about replicas, when using Replicated tables.
+         Optional. If you don't use replicated tables, you could omit that.
+
+         See https://clickhouse.com/docs/en/engines/table-engines/mergetree-family/replication/
+      -->
+    <zookeeper incl="zookeeper-servers" optional="true" />
+
+    <!-- Substitutions for parameters of replicated tables.
+          Optional. If you don't use replicated tables, you could omit that.
+         See https://clickhouse.com/docs/en/engines/table-engines/mergetree-family/replication/#creating-replicated-tables
+      -->
+    <macros incl="macros" optional="true" />
+
+
+    <!-- Reloading interval for embedded dictionaries, in seconds. Default: 3600. -->
+    <builtin_dictionaries_reload_interval>3600</builtin_dictionaries_reload_interval>
+
+    <!-- If true, dictionaries are created lazily on first use. Otherwise they are initialised on server startup. Default: true -->
+    <!-- See also: https://clickhouse.com/docs/en/operations/server-configuration-parameters/settings/#server_configuration_parameters-dictionaries_lazy_load -->
+    <dictionaries_lazy_load>True</dictionaries_lazy_load>
+
+    <!-- Maximum session timeout, in seconds. Default: 3600. -->
+    <max_session_timeout>3600</max_session_timeout>
+
+    <!-- Default session timeout, in seconds. Default: 60. -->
+    <default_session_timeout>60</default_session_timeout>
+
+    <!-- Sending data to Graphite for monitoring. Several sections can be defined. -->
+    <!--
+        interval - send every X second
+        root_path - prefix for keys
+        hostname_in_path - append hostname to root_path (default = true)
+        metrics - send data from table system.metrics
+        events - send data from table system.events
+        asynchronous_metrics - send data from table system.asynchronous_metrics
+    -->
+    <!--
+    <graphite>
+        <host>localhost</host>
+        <port>42000</port>
+        <timeout>0.1</timeout>
+        <interval>60</interval>
+        <root_path>one_min</root_path>
+        <hostname_in_path>true</hostname_in_path>
+
+        <metrics>true</metrics>
+        <events>true</events>
+        <asynchronous_metrics>true</asynchronous_metrics>
+    </graphite>
+    <graphite>
+        <host>localhost</host>
+        <port>42000</port>
+        <timeout>0.1</timeout>
+        <interval>1</interval>
+        <root_path>one_sec</root_path>
+
+        <metrics>true</metrics>
+        <events>true</events>
+        <asynchronous_metrics>false</asynchronous_metrics>
+    </graphite>
+    -->
+
+
+    <!-- Query log. Used only for queries with setting log_queries = 1. -->
+    <query_log>
+        <!-- What table to insert data. If table is not exist, it will be created.
+             When query log structure is changed after system update,
+              then old table will be renamed and new table will be created automatically.
+        -->
+        <database>system</database>
+        <table>query_log</table>
+        <!--
+            PARTITION BY expr https://clickhouse.com/docs/en/table_engines/mergetree-family/custom_partitioning_key/
+            Example:
+                event_date
+                toMonday(event_date)
+                toYYYYMM(event_date)
+                toStartOfHour(event_time)
+        -->
+        <partition_by>toYYYYMM(event_date)</partition_by>
+        <!-- Interval of flushing data. -->
+        <flush_interval_milliseconds>7500</flush_interval_milliseconds>
+    </query_log>
+
+    <!-- Query thread log. Has information about all threads participated in query execution.
+         Used only for queries with setting log_query_threads = 1. -->
+    <query_thread_log>
+        <database>system</database>
+        <table>query_thread_log</table>
+        <partition_by>toYYYYMM(event_date)</partition_by>
+
+        <flush_interval_milliseconds>7500</flush_interval_milliseconds>
+    </query_thread_log>
+
+    <!-- Uncomment if use part log.
+         Part log contains information about all actions with parts in MergeTree tables (creation, deletion, merges, downloads).
+    <part_log>
+        <database>system</database>
+        <table>part_log</table>
+        <flush_interval_milliseconds>7500</flush_interval_milliseconds>
+    </part_log>
+    -->
+
+
+    <!-- Parameters for embedded dictionaries, used in Yandex.Metrica.
+         See https://clickhouse.com/docs/en/dicts/internal_dicts/
+    -->
+
+    <!-- Path to file with region hierarchy. -->
+    <!-- <path_to_regions_hierarchy_file>/opt/geo/regions_hierarchy.txt</path_to_regions_hierarchy_file> -->
+
+    <!-- Path to directory with files containing names of regions -->
+    <!-- <path_to_regions_names_files>/opt/geo/</path_to_regions_names_files> -->
+
+
+    <!-- Configuration of external dictionaries. See:
+         https://clickhouse.com/docs/en/sql-reference/dictionaries/external-dictionaries/external-dicts
+    -->
+    <dictionaries_config>*_dictionary.xml</dictionaries_config>
+
+    <!-- Uncomment if you want data to be compressed 30-100% better.
+         Don't do that if you just started using ClickHouse.
+      -->
+    <compression incl="clickhouse_compression">
+    <!--
+        <!- - Set of variants. Checked in order. Last matching case wins. If nothing matches, lz4 will be used. - ->
+        <case>
+
+            <!- - Conditions. All must be satisfied. Some conditions may be omitted. - ->
+            <min_part_size>10000000000</min_part_size>        <!- - Min part size in bytes. - ->
+            <min_part_size_ratio>0.01</min_part_size_ratio>   <!- - Min size of part relative to whole table size. - ->
+
+            <!- - What compression method to use. - ->
+            <method>zstd</method>
+        </case>
+    -->
+    </compression>
+
+    <!-- Allow to execute distributed DDL queries (CREATE, DROP, ALTER, RENAME) on cluster.
+         Works only if ZooKeeper is enabled. Comment it if such functionality isn't required. -->
+    <distributed_ddl>
+        <!-- Path in ZooKeeper to queue with DDL queries -->
+        <path>/clickhouse/task_queue/ddl</path>
+
+        <!-- Settings from this profile will be used to execute DDL queries -->
+        <!-- <profile>default</profile> -->
+    </distributed_ddl>
+
+    <!-- Settings to fine tune MergeTree tables. See documentation in source code, in MergeTreeSettings.h -->
+        <merge_tree>
+        </merge_tree>
+
+    <!-- Protection from accidental DROP.
+         If size of a MergeTree table is greater than max_table_size_to_drop (in bytes) than table could not be dropped with any DROP query.
+         If you want do delete one table and don't want to restart clickhouse-server, you could create special file <clickhouse-path>/flags/force_drop_table and make DROP once.
+         By default max_table_size_to_drop is 50GB; max_table_size_to_drop=0 allows to DROP any tables.
+         The same for max_partition_size_to_drop.
+         Uncomment to disable protection.
+    -->
+    <!-- <max_table_size_to_drop>0</max_table_size_to_drop> -->
+    <!-- <max_partition_size_to_drop>0</max_partition_size_to_drop> -->
+
+    <!-- Example of parameters for GraphiteMergeTree table engine -->
+    <graphite_rollup_example>
+        <pattern>
+            <regexp>click_cost</regexp>
+            <function>any</function>
+            <retention>
+                <age>0</age>
+                <precision>3600</precision>
+            </retention>
+            <retention>
+                <age>86400</age>
+                <precision>60</precision>
+            </retention>
+        </pattern>
+        <default>
+            <function>max</function>
+            <retention>
+                <age>0</age>
+                <precision>60</precision>
+            </retention>
+            <retention>
+                <age>3600</age>
+                <precision>300</precision>
+            </retention>
+            <retention>
+                <age>86400</age>
+                <precision>3600</precision>
+            </retention>
+        </default>
+    </graphite_rollup_example>
+
+
+    <!-- Exposing metrics data for scraping from Prometheus. -->
+    <!--
+        endpoint – HTTP endpoint for scraping metrics by prometheus server. Start from ‘/’.
+        port – Port for endpoint.
+        metrics – Flag that sets to expose metrics from the system.metrics table.
+        events – Flag that sets to expose metrics from the system.events table.
+        asynchronous_metrics – Flag that sets to expose current metrics values from the system.asynchronous_metrics table.
+    -->
+    <!--
+    <prometheus>
+        <endpoint>/metrics</endpoint>
+        <port>8001</port>
+        <metrics>true</metrics>
+        <events>true</events>
+        <asynchronous_metrics>true</asynchronous_metrics>
+    </prometheus>
+    -->
+
+
+    <!-- Directory in <clickhouse-path> containing schema files for various input formats.
+         The directory will be created if it doesn't exist.
+      -->
+    <format_schema_path>/var/lib/clickhouse//format_schemas/</format_schema_path>
+
+    <!-- Uncomment to disable ClickHouse internal DNS caching. -->
+    <!-- <disable_internal_dns_cache>1</disable_internal_dns_cache> -->
+
+    <kafka>
+    </kafka>
+
+
+
+
+
+</clickhouse>

changed: [centos_7]

TASK [ansible-clickhouse : Config | Generate users config] *********************
--- before
+++ after: /home/.ansible/tmp/ansible-local-4875ocmz5_ty/tmp0w4na9zy/users.j2
@@ -0,0 +1,106 @@
+<?xml version="1.0"?>
+<!--
+ -
+ - Ansible managed: Do NOT edit this file manually!
+ -
+-->
+<clickhouse>
+   <profiles>
+    <!-- Profiles of settings. -->
+    <!-- Default profiles. -->
+        <default>
+            <max_memory_usage>10000000000</max_memory_usage>
+            <use_uncompressed_cache>0</use_uncompressed_cache>
+            <load_balancing>random</load_balancing>
+            <max_partitions_per_insert_block>100</max_partitions_per_insert_block>
+        </default>
+        <readonly>
+            <readonly>1</readonly>
+        </readonly>
+        <!-- Default profiles end. -->
+    <!-- Custom profiles. -->
+        <!-- Custom profiles end. -->
+    </profiles>
+
+    <!-- Users and ACL. -->
+    <users>
+    <!-- Default users. -->
+            <!-- Default user for login if user not defined -->
+        <default>
+                <password></password>
+                <networks incl="networks" replace="replace">
+                <ip>::1</ip>
+                <ip>127.0.0.1</ip>
+                </networks>
+        <profile>default</profile>
+        <quota>default</quota>
+            </default>
+            <!-- Example of user with readonly access -->
+        <readonly>
+                <password></password>
+                <networks incl="networks" replace="replace">
+                <ip>::1</ip>
+                <ip>127.0.0.1</ip>
+                </networks>
+        <profile>readonly</profile>
+        <quota>default</quota>
+            </readonly>
+        <!-- Custom users. -->
+            <!-- classic user with plain password -->
+        <testuser>
+                <password_sha256_hex>f2ca1bb6c7e907d06dafe4687e579fce76b37e4e93b7605022da52e6ccc26fd2</password_sha256_hex>
+                <networks incl="networks" replace="replace">
+                <ip>::1</ip>
+                <ip>127.0.0.1</ip>
+                </networks>
+        <profile>default</profile>
+        <quota>default</quota>
+                 <allow_databases>
+                    <database>testu1</database>
+                </allow_databases>
+                            </testuser>
+            <!-- classic user with hex password -->
+        <testuser2>
+                <password>testplpassword</password>
+                <networks incl="networks" replace="replace">
+                <ip>::1</ip>
+                <ip>127.0.0.1</ip>
+                </networks>
+        <profile>default</profile>
+        <quota>default</quota>
+                 <allow_databases>
+                    <database>testu2</database>
+                </allow_databases>
+                            </testuser2>
+            <!-- classic user with multi dbs and multi-custom network allow password -->
+        <testuser3>
+                <password>testplpassword</password>
+                <networks incl="networks" replace="replace">
+                <ip>192.168.0.0/24</ip>
+                <ip>10.0.0.0/8</ip>
+                </networks>
+        <profile>default</profile>
+        <quota>default</quota>
+                 <allow_databases>
+                    <database>testu1</database>
+                    <database>testu2</database>
+                    <database>testu3</database>
+                </allow_databases>
+                            </testuser3>
+        </users>
+
+    <!-- Quotas. -->
+    <quotas>
+        <!-- Default quotas. -->
+        <default>
+        <interval>
+        <duration>3600</duration>
+        <queries>0</queries>
+        <errors>0</errors>
+        <result_rows>0</result_rows>
+        <read_rows>0</read_rows>
+        <execution_time>0</execution_time>
+    </interval>
+        </default>
+            </quotas>
+</clickhouse>

changed: [centos_7]

TASK [ansible-clickhouse : Config | Generate remote_servers config] ************
skipping: [centos_7]

TASK [ansible-clickhouse : Config | Generate macros config] ********************
skipping: [centos_7]

TASK [ansible-clickhouse : Config | Generate zookeeper servers config] *********
skipping: [centos_7]

TASK [ansible-clickhouse : Config | Fix interserver_http_port and intersever_https_port collision] ***
skipping: [centos_7]

TASK [ansible-clickhouse : Notify Handlers Now] ********************************

RUNNING HANDLER [ansible-clickhouse : Restart Clickhouse Service] **************
ok: [centos_7]

TASK [ansible-clickhouse : include_tasks] **************************************
included: /home/08-ansible-05/ansible-clickhouse/tasks/service.yml for centos_7

TASK [ansible-clickhouse : Ensure clickhouse-server.service is enabled: True and state: restarted] ***
fatal: [centos_7]: FAILED! => {"changed": false, "msg": "Service is in unknown state", "status": {}}

PLAY RECAP *********************************************************************
centos_7                   : ok=18   changed=7    unreachable=0    failed=1    skipped=6    rescued=0    ignored=0

CRITICAL Ansible return code was 2, command was: ['ansible-playbook', '-D', '--inventory', '/home/.cache/molecule/ansible-clickhouse/centos_7/inventory', '--skip-tags', 'molecule-notest,notest', '/home/08-ansible-05/ansible-clickhouse/molecule/resources/playbooks/converge.yml']
WARNING  An error occurred during the test sequence action: 'converge'. Cleaning up.
INFO     Inventory /home/08-ansible-05/ansible-clickhouse/molecule/centos_7/../resources/inventory/hosts.yml linked to
 /home/.cache/molecule/ansible-clickhouse/centos_7/inventory/hosts
INFO     Inventory /home/08-ansible-05/ansible-clickhouse/molecule/centos_7/../resources/inventory/group_vars/ linked to /home/.cache/molecule/ansible-clickhouse/centos_7/inventory/group_vars
INFO     Inventory /home/08-ansible-05/ansible-clickhouse/molecule/centos_7/../resources/inventory/host_vars/ linked to /home/.cache/molecule/ansible-clickhouse/centos_7/inventory/host_vars
INFO     Running centos_7 > cleanup
WARNING  Skipping, cleanup playbook not configured.
INFO     Inventory /home/08-ansible-05/ansible-clickhouse/molecule/centos_7/../resources/inventory/hosts.yml linked to
 /home/.cache/molecule/ansible-clickhouse/centos_7/inventory/hosts
INFO     Inventory /home/08-ansible-05/ansible-clickhouse/molecule/centos_7/../resources/inventory/group_vars/ linked to /home/.cache/molecule/ansible-clickhouse/centos_7/inventory/group_vars
INFO     Inventory /home/08-ansible-05/ansible-clickhouse/molecule/centos_7/../resources/inventory/host_vars/ linked to /home/.cache/molecule/ansible-clickhouse/centos_7/inventory/host_vars
INFO     Running centos_7 > destroy

PLAY [Destroy] *****************************************************************

TASK [Destroy molecule instance(s)] ********************************************
changed: [localhost] => (item=centos_7)

TASK [Wait for instance(s) deletion to complete] *******************************
FAILED - RETRYING: [localhost]: Wait for instance(s) deletion to complete (300 retries left).
changed: [localhost] => (item=centos_7)

TASK [Delete docker networks(s)] ***********************************************

PLAY RECAP *********************************************************************
localhost                  : ok=2    changed=2    unreachable=0    failed=0    skipped=1    rescued=0    ignored=0

INFO     Pruning extra files from scenario ephemeral directory
┌──(kali㉿kali)-[~/08-ansible-05/clickhouse]
└─$ 
```
</details>

Тест выявил множество ошибок как правил YAML так и Ansible.
Большинство нарушений Ansible в данном примере - это так называемые **FQCN** (Fully Qualified Collection Name) - использование короткого имени модуля (например, `yum:` вместо `ansible.builtin.yum:`).
И вишенкой на торте является "провал", **playbook** " на шаге проверки старта `clickhouse-server.service` - из-за некорректной работы в **Docker** контейнере, где наблюдаются проблемы с функционированием **SystemD**.

---

Отчёт по модифицированному **playbook**, с использованием [docker systemctl replacement](https://github.com/gdraheim/docker-systemctl-replacement) от **Guido Draheim**

Используемое окружение на **Ubuntu 22**:

```console
┌──(kali㉿kali)-[~/08-ansible-05/clickhouse]
└─$ molecule --version
molecule 4.0.1 using python 3.10
    ansible:2.13.3
    delegated:4.0.1 from molecule
    docker:2.0.0 from molecule_docker requiring collections: community.docker>=3.0.0-a2
┌──(kali㉿kali)-[~/08-ansible-05/clickhouse]
└─$ 
```

Модифицированный `molecule/resources/playbooks/converge.yml`

```yaml
---
- name: Converge
  hosts: all
  pre_tasks:
    - name: Download SystemD replacer
      become: true
      ansible.builtin.get_url:
        url: https://raw.githubusercontent.com/gdraheim/docker-systemctl-replacement/master/files/docker/systemctl.py
        dest: /systemctl.py
        mode: "a+x"
    - name: Replace systemctl
      become: true
      ansible.builtin.copy:
        src: /systemctl.py
        remote_src: true
        dest: /usr/bin/systemctl
        force: true
  tasks:
    - name: 'Apply Clickhouse Role'
      include_role:
        name: ansible-clickhouse
```

<details>
<summary>:exclamation: Прогон теста <b>molecule</b>... Лог очень длинный :bangbang:</summary>

```console
┌──(kali㉿kali)-[~/08-ansible-05/clickhouse] molecule test -s centos_7
INFO     centos_7 scenario test matrix: dependency, lint, cleanup, destroy, syntax, create, prepare, converge, idempotence, side_effect, verify, cleanup, destroy
INFO     Performing prerun with role_name_check=0...
INFO     Set ANSIBLE_LIBRARY=/home/.cache/ansible-compat/b9a93c/modules:/home/.ansible/plugins/modules:/usr/share/ansible/plugins/modules
INFO     Set ANSIBLE_COLLECTIONS_PATH=/home/.cache/ansible-compat/b9a93c/../home/.ansible:/usr/share/ansible
INFO     Set ANSIBLE_ROLES_PATH=/home/.cache/ansible-compat/b9a93c/roles:/home/.ansible/roles:/usr/share/ansible/roles:/etc/ansible/roles
INFO     Using /home/.cache/ansible-compat/b9a93c/roles/alexeysetevoi.clickhouse symlink to current repository in order to enable Ansible to find the role using its expected full name.
INFO     Inventory /home/ansible-clickhouse/molecule/centos_7/../resources/inventory/hosts.yml linked to /home/.cache/molecule/ansible-clickhouse/centos_7/inventory/hosts
INFO     Inventory /home/ansible-clickhouse/molecule/centos_7/../resources/inventory/group_vars/ linked to /home/.cache/molecule/ansible-clickhouse/centos_7/inventory/group_vars
INFO     Inventory /home/ansible-clickhouse/molecule/centos_7/../resources/inventory/host_vars/ linked to /home/.cache/molecule/ansible-clickhouse/centos_7/inventory/host_vars
INFO     Running centos_7 > dependency
WARNING  Skipping, missing the requirements file.
WARNING  Skipping, missing the requirements file.
INFO     Inventory /home/ansible-clickhouse/molecule/centos_7/../resources/inventory/hosts.yml linked to /home/.cache/molecule/ansible-clickhouse/centos_7/inventory/hosts
INFO     Inventory /home/ansible-clickhouse/molecule/centos_7/../resources/inventory/group_vars/ linked to /home/.cache/molecule/ansible-clickhouse/centos_7/inventory/group_vars
INFO     Inventory /home/ansible-clickhouse/molecule/centos_7/../resources/inventory/host_vars/ linked to /home/.cache/molecule/ansible-clickhouse/centos_7/inventory/host_vars
INFO     Running centos_7 > lint
WARNING  Listing 61 violation(s) that are fatal
fqcn-builtins: Use FQCN for builtin actions.
handlers/main.yml:3 Task/Handler: Restart Clickhouse Service

schema: {'name': 'EL', 'versions': [7, 8]} is not valid under any of the given schemas (schema[meta])
meta/main.yml:1  Returned errors will not include exact line numbers, but they will mention
the schema name being used as a tag, like ``playbook-schema``,
``tasks-schema``.

This rule is not skippable and stops further processing of the file.

Schema bugs should be reported towards (https://github.com/ansible/schemas) project instead of ansible-lint.

If incorrect schema was picked, you might want to either:

* move the file to standard location, so its file is detected correctly.
* use ``kinds:`` option in linter config to help it pick correct file type.


fqcn-builtins: Use FQCN for builtin actions.
molecule/centos_7/converge.yml:5 Task/Handler: Include ansible-clickhouse

fqcn-builtins: Use FQCN for builtin actions.
molecule/centos_7/verify.yml:8 Task/Handler: Example assertion

fqcn-builtins: Use FQCN for builtin actions.
molecule/centos_8/converge.yml:5 Task/Handler: Include ansible-clickhouse

fqcn-builtins: Use FQCN for builtin actions.
molecule/centos_8/verify.yml:8 Task/Handler: Example assertion

schema: None is not of type 'object' (schema[inventory])
molecule/resources/inventory/hosts.yml:1  Returned errors will not include exact line numbers, but they will mention
the schema name being used as a tag, like ``playbook-schema``,
``tasks-schema``.

This rule is not skippable and stops further processing of the file.

Schema bugs should be reported towards (https://github.com/ansible/schemas) project instead of ansible-lint.

If incorrect schema was picked, you might want to either:

* move the file to standard location, so its file is detected correctly.
* use ``kinds:`` option in linter config to help it pick correct file type.


risky-file-permissions: File permissions unset or incorrect.
molecule/resources/playbooks/converge.yml:11 Task/Handler: Replace systemctl

fqcn-builtins: Use FQCN for builtin actions.
molecule/resources/playbooks/converge.yml:19 Task/Handler: Apply Clickhouse Role

fqcn-builtins: Use FQCN for builtin actions.
molecule/ubuntu_focal/converge.yml:5 Task/Handler: Include ansible-clickhouse

fqcn-builtins: Use FQCN for builtin actions.
molecule/ubuntu_focal/verify.yml:8 Task/Handler: Example assertion

fqcn-builtins: Use FQCN for builtin actions.
tasks/configure/db.yml:2 Task/Handler: Set ClickHose Connection String

jinja: Jinja2 spacing could be improved: clickhouse-client -h 127.0.0.1 --port {{ clickhouse_tcp_secure_port | default(clickhouse_tcp_port) }}{{' --secure' if clickhouse_tcp_secure_port is defined else '' }} -> clickhouse-client -h 127.0.0.1 --port {{ clickhouse_tcp_secure_port | default(clickhouse_tcp_port) }}{{ ' --secure' if clickhouse_tcp_secure_port is defined else '' }} (jinja[spacing])
tasks/configure/db.yml:2 Jinja2 template rewrite recommendation: `clickhouse-client -h 127.0.0.1 --port {{ clickhouse_tcp_secure_port | default(clickhouse_tcp_port) }}{{ ' --secure' if clickhouse_tcp_secure_port is defined else '' }}`.

fqcn-builtins: Use FQCN for builtin actions.
tasks/configure/db.yml:5 Task/Handler: Gather list of existing databases

fqcn-builtins: Use FQCN for builtin actions.
tasks/configure/db.yml:11 Task/Handler: Config | Delete database config

fqcn-builtins: Use FQCN for builtin actions.
tasks/configure/db.yml:20 Task/Handler: Config | Create database config

fqcn-builtins: Use FQCN for builtin actions.
tasks/configure/dict.yml:2 Task/Handler: Config | Generate dictionary config

jinja: Jinja2 spacing could be improved: clickhouse_dicts|length>0 -> clickhouse_dicts | length > 0 (jinja[spacing])
tasks/configure/dict.yml:2 Jinja2 template rewrite recommendation: `clickhouse_dicts | length > 0`.

fqcn-builtins: Use FQCN for builtin actions.
tasks/configure/sys.yml:2 Task/Handler: Check clickhouse config, data and logs

fqcn-builtins: Use FQCN for builtin actions.
tasks/configure/sys.yml:17 Task/Handler: Config | Create config.d folder

fqcn-builtins: Use FQCN for builtin actions.
tasks/configure/sys.yml:26 Task/Handler: Config | Create users.d folder

fqcn-builtins: Use FQCN for builtin actions.
tasks/configure/sys.yml:35 Task/Handler: Config | Generate system config

fqcn-builtins: Use FQCN for builtin actions.
tasks/configure/sys.yml:45 Task/Handler: Config | Generate users config

fqcn-builtins: Use FQCN for builtin actions.
tasks/configure/sys.yml:54 Task/Handler: Config | Generate remote_servers config

fqcn-builtins: Use FQCN for builtin actions.
tasks/configure/sys.yml:65 Task/Handler: Config | Generate macros config

fqcn-builtins: Use FQCN for builtin actions.
tasks/configure/sys.yml:76 Task/Handler: Config | Generate zookeeper servers config

fqcn-builtins: Use FQCN for builtin actions.
tasks/configure/sys.yml:87 Task/Handler: Config | Fix interserver_http_port and intersever_https_port collision

fqcn-builtins: Use FQCN for builtin actions.
tasks/install/apt.yml:5 Task/Handler: Install by APT | Apt-key add repo key

fqcn-builtins: Use FQCN for builtin actions.
tasks/install/apt.yml:12 Task/Handler: Install by APT | Remove old repo

fqcn-builtins: Use FQCN for builtin actions.
tasks/install/apt.yml:20 Task/Handler: Install by APT | Repo installation

fqcn-builtins: Use FQCN for builtin actions.
tasks/install/apt.yml:27 Task/Handler: Install by APT | Package installation

fqcn-builtins: Use FQCN for builtin actions.
tasks/install/apt.yml:36 Task/Handler: Install by APT | Package installation

fqcn-builtins: Use FQCN for builtin actions.
tasks/install/apt.yml:45 Task/Handler: Hold specified version during APT upgrade | Package installation

risky-file-permissions: File permissions unset or incorrect.
tasks/install/apt.yml:45 Task/Handler: Hold specified version during APT upgrade | Package installation

fqcn-builtins: Use FQCN for builtin actions.
tasks/install/dnf.yml:5 Task/Handler: Install by YUM | Ensure clickhouse repo GPG key imported

fqcn-builtins: Use FQCN for builtin actions.
tasks/install/dnf.yml:12 Task/Handler: Install by YUM | Ensure clickhouse repo installed

fqcn-builtins: Use FQCN for builtin actions.
tasks/install/dnf.yml:24 Task/Handler: Install by YUM | Ensure clickhouse package installed (latest)

fqcn-builtins: Use FQCN for builtin actions.
tasks/install/dnf.yml:32 Task/Handler: Install by YUM | Ensure clickhouse package installed (version {{ clickhouse_version }})

fqcn-builtins: Use FQCN for builtin actions.
tasks/install/yum.yml:5 Task/Handler: Install by YUM | Ensure clickhouse repo installed

fqcn-builtins: Use FQCN for builtin actions.
tasks/install/yum.yml:16 Task/Handler: Install by YUM | Ensure clickhouse package installed (latest)

fqcn-builtins: Use FQCN for builtin actions.
tasks/install/yum.yml:24 Task/Handler: Install by YUM | Ensure clickhouse package installed (version {{ clickhouse_version }})

fqcn-builtins: Use FQCN for builtin actions.
tasks/main.yml:3 Task/Handler: Include OS Family Specific Variables

fqcn-builtins: Use FQCN for builtin actions.
tasks/main.yml:39 Task/Handler: Notify Handlers Now

fqcn-builtins: Use FQCN for builtin actions.
tasks/main.yml:45 Task/Handler: Wait for Clickhouse Server to Become Ready

jinja: Jinja2 spacing could be improved: not clickhouse_remove|bool -> not clickhouse_remove | bool (jinja[spacing])
tasks/main.yml:45 Jinja2 template rewrite recommendation: `not clickhouse_remove | bool`.

fqcn-builtins: Use FQCN for builtin actions.
tasks/params.yml:3 Task/Handler: Set clickhouse_service_enable

fqcn-builtins: Use FQCN for builtin actions.
tasks/params.yml:7 Task/Handler: Set clickhouse_service_ensure

fqcn-builtins: Use FQCN for builtin actions.
tasks/precheck.yml:1 Task/Handler: Requirements check | Checking sse4_2 support

fqcn-builtins: Use FQCN for builtin actions.
tasks/precheck.yml:5 Task/Handler: Requirements check | Not supported distribution && release

jinja: Jinja2 spacing could be improved: not clickhouse_supported|bool -> not clickhouse_supported | bool (jinja[spacing])
tasks/precheck.yml:5 Jinja2 template rewrite recommendation: `not clickhouse_supported | bool`.

fqcn-builtins: Use FQCN for builtin actions.
tasks/remove.yml:3 Task/Handler: Remove clickhouse config,data and logs

fqcn-builtins: Use FQCN for builtin actions.
tasks/remove/apt.yml:5 Task/Handler: Uninstall by APT | Package uninstallation

fqcn-builtins: Use FQCN for builtin actions.
tasks/remove/apt.yml:12 Task/Handler: Uninstall by APT | Repo uninstallation

fqcn-builtins: Use FQCN for builtin actions.
tasks/remove/apt.yml:18 Task/Handler: Uninstall by APT | Apt-key remove repo key

fqcn-builtins: Use FQCN for builtin actions.
tasks/remove/dnf.yml:5 Task/Handler: Uninstall by YUM | Ensure clickhouse package uninstalled

fqcn-builtins: Use FQCN for builtin actions.
tasks/remove/dnf.yml:12 Task/Handler: Uninstall by YUM | Ensure clickhouse repo uninstalled

fqcn-builtins: Use FQCN for builtin actions.
tasks/remove/dnf.yml:19 Task/Handler: Uninstall by YUM | Ensure clickhouse key uninstalled

fqcn-builtins: Use FQCN for builtin actions.
tasks/remove/yum.yml:5 Task/Handler: Uninstall by YUM | Ensure clickhouse package uninstalled

fqcn-builtins: Use FQCN for builtin actions.
tasks/remove/yum.yml:12 Task/Handler: Uninstall by YUM | Ensure clickhouse repo uninstalled

fqcn-builtins: Use FQCN for builtin actions.
tasks/service.yml:3 Task/Handler: Ensure {{ clickhouse_service }} is enabled: {{ clickhouse_service_enable }} and state: {{ clickhouse_service_ensure }}

jinja: Jinja2 spacing could be improved: deb http://repo.yandex.ru/clickhouse/{{ansible_distribution_release}} stable main -> deb http://repo.yandex.ru/clickhouse/{{ ansible_distribution_release }} stable main (jinja[spacing])
vars/debian.yml:4 Jinja2 template rewrite recommendation: `deb http://repo.yandex.ru/clickhouse/{{ ansible_distribution_release }} stable main`.

You can skip specific rules or tags by adding them to your configuration file:
# .config/ansible-lint.yml
warn_list:  # or 'skip_list' to silence them completely
  - experimental  # all rules tagged as experimental
  - fqcn-builtins  # Use FQCN for builtin actions.

Finished with 52 failure(s), 9 warning(s) on 56 files.
INFO     Inventory /home/ansible-clickhouse/molecule/centos_7/../resources/inventory/hosts.yml linked to /home/.cache/molecule/ansible-clickhouse/centos_7/inventory/hosts
INFO     Inventory /home/ansible-clickhouse/molecule/centos_7/../resources/inventory/group_vars/ linked to /home/.cache/molecule/ansible-clickhouse/centos_7/inventory/group_vars
INFO     Inventory /home/ansible-clickhouse/molecule/centos_7/../resources/inventory/host_vars/ linked to /home/.cache/molecule/ansible-clickhouse/centos_7/inventory/host_vars
INFO     Running centos_7 > cleanup
WARNING  Skipping, cleanup playbook not configured.
INFO     Inventory /home/ansible-clickhouse/molecule/centos_7/../resources/inventory/hosts.yml linked to /home/.cache/molecule/ansible-clickhouse/centos_7/inventory/hosts
INFO     Inventory /home/ansible-clickhouse/molecule/centos_7/../resources/inventory/group_vars/ linked to /home/.cache/molecule/ansible-clickhouse/centos_7/inventory/group_vars
INFO     Inventory /home/ansible-clickhouse/molecule/centos_7/../resources/inventory/host_vars/ linked to /home/.cache/molecule/ansible-clickhouse/centos_7/inventory/host_vars
INFO     Running centos_7 > destroy
INFO     Sanity checks: 'docker'

PLAY [Destroy] *****************************************************************

TASK [Destroy molecule instance(s)] ********************************************
changed: [localhost] => (item=centos_7)

TASK [Wait for instance(s) deletion to complete] *******************************
ok: [localhost] => (item=centos_7)

TASK [Delete docker networks(s)] ***********************************************

PLAY RECAP *********************************************************************
localhost                  : ok=2    changed=1    unreachable=0    failed=0    skipped=1    rescued=0    ignored=0

INFO     Inventory /home/ansible-clickhouse/molecule/centos_7/../resources/inventory/hosts.yml linked to /home/.cache/molecule/ansible-clickhouse/centos_7/inventory/hosts
INFO     Inventory /home/ansible-clickhouse/molecule/centos_7/../resources/inventory/group_vars/ linked to /home/.cache/molecule/ansible-clickhouse/centos_7/inventory/group_vars
INFO     Inventory /home/ansible-clickhouse/molecule/centos_7/../resources/inventory/host_vars/ linked to /home/.cache/molecule/ansible-clickhouse/centos_7/inventory/host_vars
INFO     Running centos_7 > syntax

playbook: /home/ansible-clickhouse/molecule/resources/playbooks/converge.yml
INFO     Inventory /home/ansible-clickhouse/molecule/centos_7/../resources/inventory/hosts.yml linked to /home/.cache/molecule/ansible-clickhouse/centos_7/inventory/hosts
INFO     Inventory /home/ansible-clickhouse/molecule/centos_7/../resources/inventory/group_vars/ linked to /home/.cache/molecule/ansible-clickhouse/centos_7/inventory/group_vars
INFO     Inventory /home/ansible-clickhouse/molecule/centos_7/../resources/inventory/host_vars/ linked to /home/.cache/molecule/ansible-clickhouse/centos_7/inventory/host_vars
INFO     Running centos_7 > create

PLAY [Create] ******************************************************************

TASK [Log into a Docker registry] **********************************************
skipping: [localhost] => (item=None)
skipping: [localhost]

TASK [Check presence of custom Dockerfiles] ************************************
ok: [localhost] => (item={'capabilities': ['SYS_ADMIN'], 'command': '/usr/sbin/init', 'dockerfile': '../resources/Dockerfile.j2', 'env': {'ANSIBLE_USER': 'ansible', 'DEPLOY_GROUP': 'deployer', 'SUDO_GROUP': 'wheel', 'container': 'docker'}, 'image': 'centos:7', 'name': 'centos_7', 'privileged': True, 'tmpfs': ['/run', '/tmp'], 'volumes': ['/sys/fs/cgroup:/sys/fs/cgroup']})

TASK [Create Dockerfiles from image names] *************************************
changed: [localhost] => (item={'capabilities': ['SYS_ADMIN'], 'command': '/usr/sbin/init', 'dockerfile': '../resources/Dockerfile.j2', 'env': {'ANSIBLE_USER': 'ansible', 'DEPLOY_GROUP': 'deployer', 'SUDO_GROUP': 'wheel', 'container': 'docker'}, 'image': 'centos:7', 'name': 'centos_7', 'privileged': True, 'tmpfs': ['/run', '/tmp'], 'volumes': ['/sys/fs/cgroup:/sys/fs/cgroup']})

TASK [Discover local Docker images] ********************************************
ok: [localhost] => (item={'diff': [], 'dest': '/home/.cache/molecule/ansible-clickhouse/centos_7/Dockerfile_centos_7', 'src': '/home/.ansible/tmp/ansible-tmp-1661954081.235305-32485-267253787192059/source', 'md5sum': 'e90d08cd34f49a5f8a41a07de1348618', 'checksum': '4b70768619482424811f2977aa277a5acf2b13a1', 'changed': True, 'uid': 1000, 'gid': 1000, 'owner': 'sa', 'group': 'sa', 'mode': '0600', 'state': 'file', 'size': 2199, 'invocation': {'module_args': {'src': '/home/.ansible/tmp/ansible-tmp-1661954081.235305-32485-267253787192059/source', 'dest': '/home/.cache/molecule/ansible-clickhouse/centos_7/Dockerfile_centos_7', 'mode': '0600', 'follow': False, '_original_basename': 'Dockerfile.j2', 'checksum': '4b70768619482424811f2977aa277a5acf2b13a1', 'backup': False, 'force': True, 'unsafe_writes': False, 'content': None, 'validate': None, 'directory_mode': None, 'remote_src': None, 'local_follow': None, 'owner': None, 'group': None, 'seuser': None, 'serole': None, 'selevel': None, 'setype': None, 'attributes': None}}, 'failed': False, 'item': {'capabilities': ['SYS_ADMIN'], 'command': '/usr/sbin/init', 'dockerfile': '../resources/Dockerfile.j2', 'env': {'ANSIBLE_USER': 'ansible', 'DEPLOY_GROUP': 'deployer', 'SUDO_GROUP': 'wheel', 'container': 'docker'}, 'image': 'centos:7', 'name': 'centos_7', 'privileged': True, 'tmpfs': ['/run', '/tmp'], 'volumes': ['/sys/fs/cgroup:/sys/fs/cgroup']}, 'ansible_loop_var': 'item', 'i': 0, 'ansible_index_var': 'i'})

TASK [Build an Ansible compatible image (new)] *********************************
ok: [localhost] => (item=molecule_local/centos:7)

TASK [Create docker network(s)] ************************************************

TASK [Determine the CMD directives] ********************************************
ok: [localhost] => (item={'capabilities': ['SYS_ADMIN'], 'command': '/usr/sbin/init', 'dockerfile': '../resources/Dockerfile.j2', 'env': {'ANSIBLE_USER': 'ansible', 'DEPLOY_GROUP': 'deployer', 'SUDO_GROUP': 'wheel', 'container': 'docker'}, 'image': 'centos:7', 'name': 'centos_7', 'privileged': True, 'tmpfs': ['/run', '/tmp'], 'volumes': ['/sys/fs/cgroup:/sys/fs/cgroup']})

TASK [Create molecule instance(s)] *********************************************
changed: [localhost] => (item=centos_7)

TASK [Wait for instance(s) creation to complete] *******************************
FAILED - RETRYING: [localhost]: Wait for instance(s) creation to complete (300 retries left).
changed: [localhost] => (item={'failed': 0, 'started': 1, 'finished': 0, 'ansible_job_id': '128133508658.32615', 'results_file': '/home/.ansible_async/128133508658.32615', 'changed': True, 'item': {'capabilities': ['SYS_ADMIN'], 'command': '/usr/sbin/init', 'dockerfile': '../resources/Dockerfile.j2', 'env': {'ANSIBLE_USER': 'ansible', 'DEPLOY_GROUP': 'deployer', 'SUDO_GROUP': 'wheel', 'container': 'docker'}, 'image': 'centos:7', 'name': 'centos_7', 'privileged': True, 'tmpfs': ['/run', '/tmp'], 'volumes': ['/sys/fs/cgroup:/sys/fs/cgroup']}, 'ansible_loop_var': 'item'})

PLAY RECAP *********************************************************************
localhost                  : ok=7    changed=3    unreachable=0    failed=0    skipped=2    rescued=0    ignored=0

INFO     Inventory /home/ansible-clickhouse/molecule/centos_7/../resources/inventory/hosts.yml linked to /home/.cache/molecule/ansible-clickhouse/centos_7/inventory/hosts
INFO     Inventory /home/ansible-clickhouse/molecule/centos_7/../resources/inventory/group_vars/ linked to /home/.cache/molecule/ansible-clickhouse/centos_7/inventory/group_vars
INFO     Inventory /home/ansible-clickhouse/molecule/centos_7/../resources/inventory/host_vars/ linked to /home/.cache/molecule/ansible-clickhouse/centos_7/inventory/host_vars
INFO     Running centos_7 > prepare
WARNING  Skipping, prepare playbook not configured.
INFO     Inventory /home/ansible-clickhouse/molecule/centos_7/../resources/inventory/hosts.yml linked to /home/.cache/molecule/ansible-clickhouse/centos_7/inventory/hosts
INFO     Inventory /home/ansible-clickhouse/molecule/centos_7/../resources/inventory/group_vars/ linked to /home/.cache/molecule/ansible-clickhouse/centos_7/inventory/group_vars
INFO     Inventory /home/ansible-clickhouse/molecule/centos_7/../resources/inventory/host_vars/ linked to /home/.cache/molecule/ansible-clickhouse/centos_7/inventory/host_vars
INFO     Running centos_7 > converge

PLAY [Converge] ****************************************************************

TASK [Gathering Facts] *********************************************************
ok: [centos_7]

TASK [Download SystemD replacer] ***********************************************
changed: [centos_7]

TASK [Replace systemctl] *******************************************************
changed: [centos_7]

TASK [Apply Clickhouse Role] ***************************************************

TASK [ansible-clickhouse : Include OS Family Specific Variables] ***************
ok: [centos_7]

TASK [ansible-clickhouse : include_tasks] **************************************
included: /home/ansible-clickhouse/tasks/precheck.yml for centos_7

TASK [ansible-clickhouse : Requirements check | Checking sse4_2 support] *******
ok: [centos_7]

TASK [ansible-clickhouse : Requirements check | Not supported distribution && release] ***
skipping: [centos_7]

TASK [ansible-clickhouse : include_tasks] **************************************
included: /home/ansible-clickhouse/tasks/params.yml for centos_7

TASK [ansible-clickhouse : Set clickhouse_service_enable] **********************
ok: [centos_7]

TASK [ansible-clickhouse : Set clickhouse_service_ensure] **********************
ok: [centos_7]

TASK [ansible-clickhouse : include_tasks] **************************************
included: /home/ansible-clickhouse/tasks/install/yum.yml for centos_7

TASK [ansible-clickhouse : Install by YUM | Ensure clickhouse repo installed] ***
--- before: /etc/yum.repos.d/clickhouse.repo
+++ after: /etc/yum.repos.d/clickhouse.repo
@@ -0,0 +1,7 @@
+[clickhouse]
+async = 1
+baseurl = https://packages.clickhouse.com/rpm/stable/
+enabled = 1
+gpgcheck = 0
+name = Clickhouse repo
+

changed: [centos_7]

TASK [ansible-clickhouse : Install by YUM | Ensure clickhouse package installed (latest)] ***
changed: [centos_7]

TASK [ansible-clickhouse : Install by YUM | Ensure clickhouse package installed (version latest)] ***
skipping: [centos_7]

TASK [ansible-clickhouse : include_tasks] **************************************
included: /home/ansible-clickhouse/tasks/configure/sys.yml for centos_7

TASK [ansible-clickhouse : Check clickhouse config, data and logs] *************
ok: [centos_7] => (item=/var/log/clickhouse-server)
--- before
+++ after
@@ -1,4 +1,4 @@
 {
-    "mode": "0700",
+    "mode": "0770",
     "path": "/etc/clickhouse-server"
 }

changed: [centos_7] => (item=/etc/clickhouse-server)
--- before
+++ after
@@ -1,7 +1,7 @@
 {
-    "group": 0,
-    "mode": "0755",
-    "owner": 0,
+    "group": 996,
+    "mode": "0770",
+    "owner": 999,
     "path": "/var/lib/clickhouse/tmp/",
-    "state": "absent"
+    "state": "directory"
 }

changed: [centos_7] => (item=/var/lib/clickhouse/tmp/)
--- before
+++ after
@@ -1,4 +1,4 @@
 {
-    "mode": "0700",
+    "mode": "0770",
     "path": "/var/lib/clickhouse/"
 }

changed: [centos_7] => (item=/var/lib/clickhouse/)

TASK [ansible-clickhouse : Config | Create config.d folder] ********************
--- before
+++ after
@@ -1,4 +1,4 @@
 {
-    "mode": "0500",
+    "mode": "0770",
     "path": "/etc/clickhouse-server/config.d"
 }

changed: [centos_7]

TASK [ansible-clickhouse : Config | Create users.d folder] *********************
--- before
+++ after
@@ -1,4 +1,4 @@
 {
-    "mode": "0500",
+    "mode": "0770",
     "path": "/etc/clickhouse-server/users.d"
 }

changed: [centos_7]

TASK [ansible-clickhouse : Config | Generate system config] ********************
--- before
+++ after: /home/.ansible/tmp/ansible-local-327410lkn5fza/tmp355vng43/config.j2
@@ -0,0 +1,382 @@
+<?xml version="1.0"?>
+<!--
+ -
+ - Ansible managed: Do NOT edit this file manually!
+ -
+-->
+<clickhouse>
+    <logger>
+        <!-- Possible levels: https://github.com/pocoproject/poco/blob/develop/Foundation/include/Poco/Logger.h#L105 -->
+        <level>trace</level>
+        <log>/var/log/clickhouse-server/clickhouse-server.log</log>
+        <errorlog>/var/log/clickhouse-server/clickhouse-server.err.log</errorlog>
+        <size>1000M</size>
+        <count>10</count>
+    </logger>
+
+    <http_port>8123</http_port>
+
+    <tcp_port>9000</tcp_port>
+
+    <!-- Used with https_port and tcp_port_secure. Full ssl options list: https://github.com/ClickHouse-Extras/poco/blob/master/NetSSL_OpenSSL/include/Poco/Net/SSLManager.h#L71 -->
+    <openSSL>
+        <server> <!-- Used for https server AND secure tcp port -->
+            <!-- openssl req -subj "/CN=localhost" -new -newkey rsa:2048 -days 365 -nodes -x509 -keyout /etc/clickhouse-server/server.key -out /etc/clickhouse-server/server.crt -->
+            <certificateFile>/etc/clickhouse-server/server.crt</certificateFile>
+            <privateKeyFile>/etc/clickhouse-server/server.key</privateKeyFile>
+            <!-- openssl dhparam -out /etc/clickhouse-server/dhparam.pem 4096 -->
+            <dhParamsFile>/etc/clickhouse-server/dhparam.pem</dhParamsFile>
+            <verificationMode>none</verificationMode>
+            <loadDefaultCAFile>true</loadDefaultCAFile>
+            <cacheSessions>true</cacheSessions>
+            <disableProtocols>sslv2,sslv3</disableProtocols>
+            <preferServerCiphers>true</preferServerCiphers>
+        </server>
+
+        <client> <!-- Used for connecting to https dictionary source -->
+            <loadDefaultCAFile>true</loadDefaultCAFile>
+            <cacheSessions>true</cacheSessions>
+            <disableProtocols>sslv2,sslv3</disableProtocols>
+            <preferServerCiphers>true</preferServerCiphers>
+            <!-- Use for self-signed: <verificationMode>none</verificationMode> -->
+            <invalidCertificateHandler>
+                <!-- Use for self-signed: <name>AcceptCertificateHandler</name> -->
+                <name>RejectCertificateHandler</name>
+            </invalidCertificateHandler>
+        </client>
+    </openSSL>
+
+    <!-- Default root page on http[s] server. For example load UI from https://tabix.io/ when opening http://localhost:8123 -->
+    <!--
+    <http_server_default_response><![CDATA[<html ng-app="SMI2"><head><base href="http://ui.tabix.io/"></head><body><div ui-view="" class="content-ui"></div><script src="http://loader.tabix.io/master.js"></script></body></html>]]></http_server_default_response>
+    -->
+
+    <!-- Port for communication between replicas. Used for data exchange. -->
+    <interserver_http_port>9009</interserver_http_port>
+
+
+
+    <!-- Hostname that is used by other replicas to request this server.
+         If not specified, than it is determined analoguous to 'hostname -f' command.
+         This setting could be used to switch replication to another network interface.
+      -->
+    <!--
+    <interserver_http_host>example.clickhouse.com</interserver_http_host>
+    -->
+
+    <!-- Listen specified host. use :: (wildcard IPv6 address), if you want to accept connections both with IPv4 and IPv6 from everywhere. -->
+    <!-- <listen_host>::</listen_host> -->
+    <!-- Same for hosts with disabled ipv6: -->
+    <!-- <listen_host>0.0.0.0</listen_host> -->
+    <listen_host>127.0.0.1</listen_host>
+
+    <max_connections>2048</max_connections>
+    <keep_alive_timeout>3</keep_alive_timeout>
+
+    <!-- Maximum number of concurrent queries. -->
+    <max_concurrent_queries>100</max_concurrent_queries>
+
+    <!-- Set limit on number of open files (default: maximum). This setting makes sense on Mac OS X because getrlimit() fails to retrieve
+         correct maximum value. -->
+    <!-- <max_open_files>262144</max_open_files> -->
+
+    <!-- Size of cache of uncompressed blocks of data, used in tables of MergeTree family.
+         In bytes. Cache is single for server. Memory is allocated only on demand.
+         Cache is used when 'use_uncompressed_cache' user setting turned on (off by default).
+         Uncompressed cache is advantageous only for very short queries and in rare cases.
+      -->
+    <uncompressed_cache_size>8589934592</uncompressed_cache_size>
+
+    <!-- Approximate size of mark cache, used in tables of MergeTree family.
+         In bytes. Cache is single for server. Memory is allocated only on demand.
+         You should not lower this value.
+      -->
+    <mark_cache_size>5368709120</mark_cache_size>
+
+
+    <!-- Path to data directory, with trailing slash. -->
+    <path>/var/lib/clickhouse/</path>
+
+    <!-- Path to temporary data for processing hard queries. -->
+    <tmp_path>/var/lib/clickhouse/tmp/</tmp_path>
+
+    <!-- Directory with user provided files that are accessible by 'file' table function. -->
+    <user_files_path>/var/lib/clickhouse/user_files/</user_files_path>
+
+    <!-- Path to configuration file with users, access rights, profiles of settings, quotas. -->
+    <users_config>users.xml</users_config>
+
+    <!-- Default profile of settings. -->
+    <default_profile>default</default_profile>
+
+    <!-- System profile of settings. This settings are used by internal processes (Buffer storage, Distibuted DDL worker and so on). -->
+    <!-- <system_profile>default</system_profile> -->
+
+    <!-- Default database. -->
+    <default_database>default</default_database>
+
+    <!-- Server time zone could be set here.
+
+         Time zone is used when converting between String and DateTime types,
+          when printing DateTime in text formats and parsing DateTime from text,
+          it is used in date and time related functions, if specific time zone was not passed as an argument.
+
+         Time zone is specified as identifier from IANA time zone database, like UTC or Africa/Abidjan.
+         If not specified, system time zone at server startup is used.
+
+         Please note, that server could display time zone alias instead of specified name.
+         Example: W-SU is an alias for Europe/Moscow and Zulu is an alias for UTC.
+    -->
+    <!-- <timezone>Europe/Moscow</timezone> -->
+
+    <!-- You can specify umask here (see "man umask"). Server will apply it on startup.
+         Number is always parsed as octal. Default umask is 027 (other users cannot read logs, data files, etc; group can only read).
+    -->
+    <!-- <umask>022</umask> -->
+
+    <!-- Perform mlockall after startup to lower first queries latency
+          and to prevent clickhouse executable from being paged out under high IO load.
+         Enabling this option is recommended but will lead to increased startup time for up to a few seconds.
+    -->
+    <mlock_executable>False</mlock_executable>
+
+    <!-- Configuration of clusters that could be used in Distributed tables.
+         https://clickhouse.com/docs/en/engines/table-engines/special/distributed/
+      -->
+    <remote_servers incl="clickhouse_remote_servers" />
+
+
+    <!-- If element has 'incl' attribute, then for it's value will be used corresponding substitution from another file.
+         By default, path to file with substitutions is /etc/metrika.xml. It could be changed in config in 'include_from' element.
+         Values for substitutions are specified in /clickhouse/name_of_substitution elements in that file.
+      -->
+
+    <!-- ZooKeeper is used to store metadata about replicas, when using Replicated tables.
+         Optional. If you don't use replicated tables, you could omit that.
+
+         See https://clickhouse.com/docs/en/engines/table-engines/mergetree-family/replication/
+      -->
+    <zookeeper incl="zookeeper-servers" optional="true" />
+
+    <!-- Substitutions for parameters of replicated tables.
+          Optional. If you don't use replicated tables, you could omit that.
+         See https://clickhouse.com/docs/en/engines/table-engines/mergetree-family/replication/#creating-replicated-tables
+      -->
+    <macros incl="macros" optional="true" />
+
+
+    <!-- Reloading interval for embedded dictionaries, in seconds. Default: 3600. -->
+    <builtin_dictionaries_reload_interval>3600</builtin_dictionaries_reload_interval>
+
+    <!-- If true, dictionaries are created lazily on first use. Otherwise they are initialised on server startup. Default: true -->
+    <!-- See also: https://clickhouse.com/docs/en/operations/server-configuration-parameters/settings/#server_configuration_parameters-dictionaries_lazy_load -->
+    <dictionaries_lazy_load>True</dictionaries_lazy_load>
+
+    <!-- Maximum session timeout, in seconds. Default: 3600. -->
+    <max_session_timeout>3600</max_session_timeout>
+
+    <!-- Default session timeout, in seconds. Default: 60. -->
+    <default_session_timeout>60</default_session_timeout>
+
+    <!-- Sending data to Graphite for monitoring. Several sections can be defined. -->
+    <!--
+        interval - send every X second
+        root_path - prefix for keys
+        hostname_in_path - append hostname to root_path (default = true)
+        metrics - send data from table system.metrics
+        events - send data from table system.events
+        asynchronous_metrics - send data from table system.asynchronous_metrics
+    -->
+    <!--
+    <graphite>
+        <host>localhost</host>
+        <port>42000</port>
+        <timeout>0.1</timeout>
+        <interval>60</interval>
+        <root_path>one_min</root_path>
+        <hostname_in_path>true</hostname_in_path>
+
+        <metrics>true</metrics>
+        <events>true</events>
+        <asynchronous_metrics>true</asynchronous_metrics>
+    </graphite>
+    <graphite>
+        <host>localhost</host>
+        <port>42000</port>
+        <timeout>0.1</timeout>
+        <interval>1</interval>
+        <root_path>one_sec</root_path>
+
+        <metrics>true</metrics>
+        <events>true</events>
+        <asynchronous_metrics>false</asynchronous_metrics>
+    </graphite>
+    -->
+
+
+    <!-- Query log. Used only for queries with setting log_queries = 1. -->
+    <query_log>
+        <!-- What table to insert data. If table is not exist, it will be created.
+             When query log structure is changed after system update,
+              then old table will be renamed and new table will be created automatically.
+        -->
+        <database>system</database>
+        <table>query_log</table>
+        <!--
+            PARTITION BY expr https://clickhouse.com/docs/en/table_engines/mergetree-family/custom_partitioning_key/
+            Example:
+                event_date
+                toMonday(event_date)
+                toYYYYMM(event_date)
+                toStartOfHour(event_time)
+        -->
+        <partition_by>toYYYYMM(event_date)</partition_by>
+        <!-- Interval of flushing data. -->
+        <flush_interval_milliseconds>7500</flush_interval_milliseconds>
+    </query_log>
+
+    <!-- Query thread log. Has information about all threads participated in query execution.
+         Used only for queries with setting log_query_threads = 1. -->
+    <query_thread_log>
+        <database>system</database>
+        <table>query_thread_log</table>
+        <partition_by>toYYYYMM(event_date)</partition_by>
+
+        <flush_interval_milliseconds>7500</flush_interval_milliseconds>
+    </query_thread_log>
+
+    <!-- Uncomment if use part log.
+         Part log contains information about all actions with parts in MergeTree tables (creation, deletion, merges, downloads).
+    <part_log>
+        <database>system</database>
+        <table>part_log</table>
+        <flush_interval_milliseconds>7500</flush_interval_milliseconds>
+    </part_log>
+    -->
+
+
+    <!-- Parameters for embedded dictionaries, used in Yandex.Metrica.
+         See https://clickhouse.com/docs/en/dicts/internal_dicts/
+    -->
+
+    <!-- Path to file with region hierarchy. -->
+    <!-- <path_to_regions_hierarchy_file>/opt/geo/regions_hierarchy.txt</path_to_regions_hierarchy_file> -->
+
+    <!-- Path to directory with files containing names of regions -->
+    <!-- <path_to_regions_names_files>/opt/geo/</path_to_regions_names_files> -->
+
+
+    <!-- Configuration of external dictionaries. See:
+         https://clickhouse.com/docs/en/sql-reference/dictionaries/external-dictionaries/external-dicts
+    -->
+    <dictionaries_config>*_dictionary.xml</dictionaries_config>
+
+    <!-- Uncomment if you want data to be compressed 30-100% better.
+         Don't do that if you just started using ClickHouse.
+      -->
+    <compression incl="clickhouse_compression">
+    <!--
+        <!- - Set of variants. Checked in order. Last matching case wins. If nothing matches, lz4 will be used. - ->
+        <case>
+
+            <!- - Conditions. All must be satisfied. Some conditions may be omitted. - ->
+            <min_part_size>10000000000</min_part_size>        <!- - Min part size in bytes. - ->
+            <min_part_size_ratio>0.01</min_part_size_ratio>   <!- - Min size of part relative to whole table size. - ->
+
+            <!- - What compression method to use. - ->
+            <method>zstd</method>
+        </case>
+    -->
+    </compression>
+
+    <!-- Allow to execute distributed DDL queries (CREATE, DROP, ALTER, RENAME) on cluster.
+         Works only if ZooKeeper is enabled. Comment it if such functionality isn't required. -->
+    <distributed_ddl>
+        <!-- Path in ZooKeeper to queue with DDL queries -->
+        <path>/clickhouse/task_queue/ddl</path>
+
+        <!-- Settings from this profile will be used to execute DDL queries -->
+        <!-- <profile>default</profile> -->
+    </distributed_ddl>
+
+    <!-- Settings to fine tune MergeTree tables. See documentation in source code, in MergeTreeSettings.h -->
+        <merge_tree>
+        </merge_tree>
+
+    <!-- Protection from accidental DROP.
+         If size of a MergeTree table is greater than max_table_size_to_drop (in bytes) than table could not be dropped with any DROP query.
+         If you want do delete one table and don't want to restart clickhouse-server, you could create special file <clickhouse-path>/flags/force_drop_table and make DROP once.
+         By default max_table_size_to_drop is 50GB; max_table_size_to_drop=0 allows to DROP any tables.
+         The same for max_partition_size_to_drop.
+         Uncomment to disable protection.
+    -->
+    <!-- <max_table_size_to_drop>0</max_table_size_to_drop> -->
+    <!-- <max_partition_size_to_drop>0</max_partition_size_to_drop> -->
+
+    <!-- Example of parameters for GraphiteMergeTree table engine -->
+    <graphite_rollup_example>
+        <pattern>
+            <regexp>click_cost</regexp>
+            <function>any</function>
+            <retention>
+                <age>0</age>
+                <precision>3600</precision>
+            </retention>
+            <retention>
+                <age>86400</age>
+                <precision>60</precision>
+            </retention>
+        </pattern>
+        <default>
+            <function>max</function>
+            <retention>
+                <age>0</age>
+                <precision>60</precision>
+            </retention>
+            <retention>
+                <age>3600</age>
+                <precision>300</precision>
+            </retention>
+            <retention>
+                <age>86400</age>
+                <precision>3600</precision>
+            </retention>
+        </default>
+    </graphite_rollup_example>
+
+
+    <!-- Exposing metrics data for scraping from Prometheus. -->
+    <!--
+        endpoint – HTTP endpoint for scraping metrics by prometheus server. Start from ‘/’.
+        port – Port for endpoint.
+        metrics – Flag that sets to expose metrics from the system.metrics table.
+        events – Flag that sets to expose metrics from the system.events table.
+        asynchronous_metrics – Flag that sets to expose current metrics values from the system.asynchronous_metrics table.
+    -->
+    <!--
+    <prometheus>
+        <endpoint>/metrics</endpoint>
+        <port>8001</port>
+        <metrics>true</metrics>
+        <events>true</events>
+        <asynchronous_metrics>true</asynchronous_metrics>
+    </prometheus>
+    -->
+
+
+    <!-- Directory in <clickhouse-path> containing schema files for various input formats.
+         The directory will be created if it doesn't exist.
+      -->
+    <format_schema_path>/var/lib/clickhouse//format_schemas/</format_schema_path>
+
+    <!-- Uncomment to disable ClickHouse internal DNS caching. -->
+    <!-- <disable_internal_dns_cache>1</disable_internal_dns_cache> -->
+
+    <kafka>
+    </kafka>
+
+
+
+
+
+</clickhouse>

changed: [centos_7]

TASK [ansible-clickhouse : Config | Generate users config] *********************
--- before
+++ after: /home/.ansible/tmp/ansible-local-327410lkn5fza/tmprm7rasbr/users.j2
@@ -0,0 +1,106 @@
+<?xml version="1.0"?>
+<!--
+ -
+ - Ansible managed: Do NOT edit this file manually!
+ -
+-->
+<clickhouse>
+   <profiles>
+    <!-- Profiles of settings. -->
+    <!-- Default profiles. -->
+        <default>
+            <max_memory_usage>10000000000</max_memory_usage>
+            <use_uncompressed_cache>0</use_uncompressed_cache>
+            <load_balancing>random</load_balancing>
+            <max_partitions_per_insert_block>100</max_partitions_per_insert_block>
+        </default>
+        <readonly>
+            <readonly>1</readonly>
+        </readonly>
+        <!-- Default profiles end. -->
+    <!-- Custom profiles. -->
+        <!-- Custom profiles end. -->
+    </profiles>
+
+    <!-- Users and ACL. -->
+    <users>
+    <!-- Default users. -->
+            <!-- Default user for login if user not defined -->
+        <default>
+                <password></password>
+                <networks incl="networks" replace="replace">
+                <ip>::1</ip>
+                <ip>127.0.0.1</ip>
+                </networks>
+        <profile>default</profile>
+        <quota>default</quota>
+            </default>
+            <!-- Example of user with readonly access -->
+        <readonly>
+                <password></password>
+                <networks incl="networks" replace="replace">
+                <ip>::1</ip>
+                <ip>127.0.0.1</ip>
+                </networks>
+        <profile>readonly</profile>
+        <quota>default</quota>
+            </readonly>
+        <!-- Custom users. -->
+            <!-- classic user with plain password -->
+        <testuser>
+                <password_sha256_hex>f2ca1bb6c7e907d06dafe4687e579fce76b37e4e93b7605022da52e6ccc26fd2</password_sha256_hex>
+                <networks incl="networks" replace="replace">
+                <ip>::1</ip>
+                <ip>127.0.0.1</ip>
+                </networks>
+        <profile>default</profile>
+        <quota>default</quota>
+                 <allow_databases>
+                    <database>testu1</database>
+                </allow_databases>
+                            </testuser>
+            <!-- classic user with hex password -->
+        <testuser2>
+                <password>testplpassword</password>
+                <networks incl="networks" replace="replace">
+                <ip>::1</ip>
+                <ip>127.0.0.1</ip>
+                </networks>
+        <profile>default</profile>
+        <quota>default</quota>
+                 <allow_databases>
+                    <database>testu2</database>
+                </allow_databases>
+                            </testuser2>
+            <!-- classic user with multi dbs and multi-custom network allow password -->
+        <testuser3>
+                <password>testplpassword</password>
+                <networks incl="networks" replace="replace">
+                <ip>192.168.0.0/24</ip>
+                <ip>10.0.0.0/8</ip>
+                </networks>
+        <profile>default</profile>
+        <quota>default</quota>
+                 <allow_databases>
+                    <database>testu1</database>
+                    <database>testu2</database>
+                    <database>testu3</database>
+                </allow_databases>
+                            </testuser3>
+        </users>
+
+    <!-- Quotas. -->
+    <quotas>
+        <!-- Default quotas. -->
+        <default>
+        <interval>
+        <duration>3600</duration>
+        <queries>0</queries>
+        <errors>0</errors>
+        <result_rows>0</result_rows>
+        <read_rows>0</read_rows>
+        <execution_time>0</execution_time>
+    </interval>
+        </default>
+            </quotas>
+</clickhouse>

changed: [centos_7]

TASK [ansible-clickhouse : Config | Generate remote_servers config] ************
skipping: [centos_7]

TASK [ansible-clickhouse : Config | Generate macros config] ********************
skipping: [centos_7]

TASK [ansible-clickhouse : Config | Generate zookeeper servers config] *********
skipping: [centos_7]

TASK [ansible-clickhouse : Config | Fix interserver_http_port and intersever_https_port collision] ***
skipping: [centos_7]

TASK [ansible-clickhouse : Notify Handlers Now] ********************************

RUNNING HANDLER [ansible-clickhouse : Restart Clickhouse Service] **************
ok: [centos_7]

TASK [ansible-clickhouse : include_tasks] **************************************
included: /home/ansible-clickhouse/tasks/service.yml for centos_7

TASK [ansible-clickhouse : Ensure clickhouse-server.service is enabled: True and state: restarted] ***
changed: [centos_7]

TASK [ansible-clickhouse : Wait for Clickhouse Server to Become Ready] *********
ok: [centos_7]

TASK [ansible-clickhouse : include_tasks] **************************************
included: /home/ansible-clickhouse/tasks/configure/db.yml for centos_7

TASK [ansible-clickhouse : Set ClickHose Connection String] ********************
ok: [centos_7]

TASK [ansible-clickhouse : Gather list of existing databases] ******************
ok: [centos_7]

TASK [ansible-clickhouse : Config | Delete database config] ********************
skipping: [centos_7] => (item={'name': 'testu1'})
skipping: [centos_7] => (item={'name': 'testu2'})
skipping: [centos_7] => (item={'name': 'testu3'})
skipping: [centos_7] => (item={'name': 'testu4', 'state': 'absent'})

TASK [ansible-clickhouse : Config | Create database config] ********************
changed: [centos_7] => (item={'name': 'testu1'})
changed: [centos_7] => (item={'name': 'testu2'})
changed: [centos_7] => (item={'name': 'testu3'})
skipping: [centos_7] => (item={'name': 'testu4', 'state': 'absent'})

TASK [ansible-clickhouse : include_tasks] **************************************
included: /home/ansible-clickhouse/tasks/configure/dict.yml for centos_7

TASK [ansible-clickhouse : Config | Generate dictionary config] ****************
--- before
+++ after: /home/.ansible/tmp/ansible-local-327410lkn5fza/tmp08paiyou/dicts.j2
@@ -0,0 +1,63 @@
+<?xml version="1.0"?>
+<!--
+ -
+ - Ansible managed: Do NOT edit this file manually!
+ -
+-->
+<clickhouse>
+ <dictionary>
+   <name>test_dict</name>
+   <source>
+    <odbc>
+     <connection_string>DSN=testdb</connection_string>
+     <table>dict_source</table>
+    </odbc>
+   </source>
+   <lifetime>
+     <min>300</min>
+     <max>360</max>
+   </lifetime>
+   <layout>
+     <hashed/>
+   </layout>
+   <structure>
+     <id>
+       <name>testIntKey</name>
+     </id>
+     <attribute>
+       <name>testAttrName</name>
+       <type>UInt32</type>
+       <null_value>0</null_value>
+     </attribute>
+   </structure>
+ </dictionary>
+ <dictionary>
+   <name>test_dict</name>
+   <source>
+    <odbc>
+     <connection_string>DSN=testdb</connection_string>
+     <table>dict_source</table>
+    </odbc>
+   </source>
+   <lifetime>
+     <min>300</min>
+     <max>360</max>
+   </lifetime>
+   <layout>
+     <complex_key_hashed/>
+   </layout>
+   <structure>
+     <key>
+     <attribute>
+       <name>testAttrComplexName</name>
+       <type>String</type>
+     </attribute>
+     </key>
+     <attribute>
+       <name>testAttrName</name>
+       <type>String</type>
+       <null_value></null_value>
+     </attribute>
+   </structure>
+ </dictionary>
+</clickhouse>

changed: [centos_7]

TASK [ansible-clickhouse : include_tasks] **************************************
skipping: [centos_7]

PLAY RECAP *********************************************************************
centos_7                   : ok=28   changed=12   unreachable=0    failed=0    skipped=8    rescued=0    ignored=0

INFO     Inventory /home/ansible-clickhouse/molecule/centos_7/../resources/inventory/hosts.yml linked to /home/.cache/molecule/ansible-clickhouse/centos_7/inventory/hosts
INFO     Inventory /home/ansible-clickhouse/molecule/centos_7/../resources/inventory/group_vars/ linked to /home/.cache/molecule/ansible-clickhouse/centos_7/inventory/group_vars
INFO     Inventory /home/ansible-clickhouse/molecule/centos_7/../resources/inventory/host_vars/ linked to /home/.cache/molecule/ansible-clickhouse/centos_7/inventory/host_vars
INFO     Running centos_7 > idempotence

PLAY [Converge] ****************************************************************

TASK [Gathering Facts] *********************************************************
ok: [centos_7]

TASK [Download SystemD replacer] ***********************************************
ok: [centos_7]

TASK [Replace systemctl] *******************************************************
ok: [centos_7]

TASK [Apply Clickhouse Role] ***************************************************

TASK [ansible-clickhouse : Include OS Family Specific Variables] ***************
ok: [centos_7]

TASK [ansible-clickhouse : include_tasks] **************************************
included: /home/ansible-clickhouse/tasks/precheck.yml for centos_7

TASK [ansible-clickhouse : Requirements check | Checking sse4_2 support] *******
ok: [centos_7]

TASK [ansible-clickhouse : Requirements check | Not supported distribution && release] ***
skipping: [centos_7]

TASK [ansible-clickhouse : include_tasks] **************************************
included: /home/ansible-clickhouse/tasks/params.yml for centos_7

TASK [ansible-clickhouse : Set clickhouse_service_enable] **********************
ok: [centos_7]

TASK [ansible-clickhouse : Set clickhouse_service_ensure] **********************
ok: [centos_7]

TASK [ansible-clickhouse : include_tasks] **************************************
included: /home/ansible-clickhouse/tasks/install/yum.yml for centos_7

TASK [ansible-clickhouse : Install by YUM | Ensure clickhouse repo installed] ***
ok: [centos_7]

TASK [ansible-clickhouse : Install by YUM | Ensure clickhouse package installed (latest)] ***
ok: [centos_7]

TASK [ansible-clickhouse : Install by YUM | Ensure clickhouse package installed (version latest)] ***
skipping: [centos_7]

TASK [ansible-clickhouse : include_tasks] **************************************
included: /home/ansible-clickhouse/tasks/configure/sys.yml for centos_7

TASK [ansible-clickhouse : Check clickhouse config, data and logs] *************
ok: [centos_7] => (item=/var/log/clickhouse-server)
ok: [centos_7] => (item=/etc/clickhouse-server)
ok: [centos_7] => (item=/var/lib/clickhouse/tmp/)
ok: [centos_7] => (item=/var/lib/clickhouse/)

TASK [ansible-clickhouse : Config | Create config.d folder] ********************
ok: [centos_7]

TASK [ansible-clickhouse : Config | Create users.d folder] *********************
ok: [centos_7]

TASK [ansible-clickhouse : Config | Generate system config] ********************
ok: [centos_7]

TASK [ansible-clickhouse : Config | Generate users config] *********************
ok: [centos_7]

TASK [ansible-clickhouse : Config | Generate remote_servers config] ************
skipping: [centos_7]

TASK [ansible-clickhouse : Config | Generate macros config] ********************
skipping: [centos_7]

TASK [ansible-clickhouse : Config | Generate zookeeper servers config] *********
skipping: [centos_7]

TASK [ansible-clickhouse : Config | Fix interserver_http_port and intersever_https_port collision] ***
skipping: [centos_7]

TASK [ansible-clickhouse : Notify Handlers Now] ********************************

TASK [ansible-clickhouse : include_tasks] **************************************
included: /home/ansible-clickhouse/tasks/service.yml for centos_7

TASK [ansible-clickhouse : Ensure clickhouse-server.service is enabled: True and state: started] ***
ok: [centos_7]

TASK [ansible-clickhouse : Wait for Clickhouse Server to Become Ready] *********
ok: [centos_7]

TASK [ansible-clickhouse : include_tasks] **************************************
included: /home/ansible-clickhouse/tasks/configure/db.yml for centos_7

TASK [ansible-clickhouse : Set ClickHose Connection String] ********************
ok: [centos_7]

TASK [ansible-clickhouse : Gather list of existing databases] ******************
ok: [centos_7]

TASK [ansible-clickhouse : Config | Delete database config] ********************
skipping: [centos_7] => (item={'name': 'testu1'})
skipping: [centos_7] => (item={'name': 'testu2'})
skipping: [centos_7] => (item={'name': 'testu3'})
skipping: [centos_7] => (item={'name': 'testu4', 'state': 'absent'})

TASK [ansible-clickhouse : Config | Create database config] ********************
skipping: [centos_7] => (item={'name': 'testu1'})
skipping: [centos_7] => (item={'name': 'testu2'})
skipping: [centos_7] => (item={'name': 'testu3'})
skipping: [centos_7] => (item={'name': 'testu4', 'state': 'absent'})

TASK [ansible-clickhouse : include_tasks] **************************************
included: /home/ansible-clickhouse/tasks/configure/dict.yml for centos_7

TASK [ansible-clickhouse : Config | Generate dictionary config] ****************
ok: [centos_7]

TASK [ansible-clickhouse : include_tasks] **************************************
skipping: [centos_7]

PLAY RECAP *********************************************************************
centos_7                   : ok=26   changed=0    unreachable=0    failed=0    skipped=9    rescued=0    ignored=0

INFO     Idempotence completed successfully.
INFO     Inventory /home/ansible-clickhouse/molecule/centos_7/../resources/inventory/hosts.yml linked to /home/.cache/molecule/ansible-clickhouse/centos_7/inventory/hosts
INFO     Inventory /home/ansible-clickhouse/molecule/centos_7/../resources/inventory/group_vars/ linked to /home/.cache/molecule/ansible-clickhouse/centos_7/inventory/group_vars
INFO     Inventory /home/ansible-clickhouse/molecule/centos_7/../resources/inventory/host_vars/ linked to /home/.cache/molecule/ansible-clickhouse/centos_7/inventory/host_vars
INFO     Running centos_7 > side_effect
WARNING  Skipping, side effect playbook not configured.
INFO     Inventory /home/ansible-clickhouse/molecule/centos_7/../resources/inventory/hosts.yml linked to /home/.cache/molecule/ansible-clickhouse/centos_7/inventory/hosts
INFO     Inventory /home/ansible-clickhouse/molecule/centos_7/../resources/inventory/group_vars/ linked to /home/.cache/molecule/ansible-clickhouse/centos_7/inventory/group_vars
INFO     Inventory /home/ansible-clickhouse/molecule/centos_7/../resources/inventory/host_vars/ linked to /home/.cache/molecule/ansible-clickhouse/centos_7/inventory/host_vars
INFO     Running centos_7 > verify
INFO     Running Ansible Verifier

PLAY [Verify] ******************************************************************

TASK [Example assertion] *******************************************************
ok: [centos_7] => {
    "changed": false,
    "msg": "All assertions passed"
}

PLAY RECAP *********************************************************************
centos_7                   : ok=1    changed=0    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0

INFO     Verifier completed successfully.
INFO     Inventory /home/ansible-clickhouse/molecule/centos_7/../resources/inventory/hosts.yml linked to /home/.cache/molecule/ansible-clickhouse/centos_7/inventory/hosts
INFO     Inventory /home/ansible-clickhouse/molecule/centos_7/../resources/inventory/group_vars/ linked to /home/.cache/molecule/ansible-clickhouse/centos_7/inventory/group_vars
INFO     Inventory /home/ansible-clickhouse/molecule/centos_7/../resources/inventory/host_vars/ linked to /home/.cache/molecule/ansible-clickhouse/centos_7/inventory/host_vars
INFO     Running centos_7 > cleanup
WARNING  Skipping, cleanup playbook not configured.
INFO     Inventory /home/ansible-clickhouse/molecule/centos_7/../resources/inventory/hosts.yml linked to /home/.cache/molecule/ansible-clickhouse/centos_7/inventory/hosts
INFO     Inventory /home/ansible-clickhouse/molecule/centos_7/../resources/inventory/group_vars/ linked to /home/.cache/molecule/ansible-clickhouse/centos_7/inventory/group_vars
INFO     Inventory /home/ansible-clickhouse/molecule/centos_7/../resources/inventory/host_vars/ linked to /home/.cache/molecule/ansible-clickhouse/centos_7/inventory/host_vars
INFO     Running centos_7 > destroy

PLAY [Destroy] *****************************************************************

TASK [Destroy molecule instance(s)] ********************************************
changed: [localhost] => (item=centos_7)

TASK [Wait for instance(s) deletion to complete] *******************************
FAILED - RETRYING: [localhost]: Wait for instance(s) deletion to complete (300 retries left).
changed: [localhost] => (item=centos_7)

TASK [Delete docker networks(s)] ***********************************************

PLAY RECAP *********************************************************************
localhost                  : ok=2    changed=2    unreachable=0    failed=0    skipped=1    rescued=0    ignored=0

INFO     Pruning extra files from scenario ephemeral directory
┌──(kali㉿kali)-[~/08-ansible-05/clickhouse]
└─$ 

'''

---





### Tox

1. Добавьте в директорию с vector-role файлы из [директории](./example)
2. Запустите `docker run --privileged=True -v <path_to_repo>:/opt/vector-role -w /opt/vector-role -it aragast/netology:latest /bin/bash`, где path_to_repo - путь до корня репозитория с vector-role на вашей файловой системе.
3. Внутри контейнера выполните команду `tox`, посмотрите на вывод.
5. Создайте облегчённый сценарий для `molecule` с драйвером `molecule_podman`. Проверьте его на исполнимость.
6. Пропишите правильную команду в `tox.ini` для того чтобы запускался облегчённый сценарий.
8. Запустите команду `tox`. Убедитесь, что всё отработало успешно.
9. Добавьте новый тег на коммит с рабочим сценарием в соответствии с семантическим версионированием.

После выполнения у вас должно получится два сценария molecule и один tox.ini файл в репозитории. Не забудьте указать в ответе теги решений Tox и Molecule заданий. В качестве решения пришлите ссылку на  ваш репозиторий и скриншоты этапов выполнения задания. 

## Необязательная часть

1. Проделайте схожие манипуляции для создания роли lighthouse.
2. Создайте сценарий внутри любой из своих ролей, который умеет поднимать весь стек при помощи всех ролей.
3. Убедитесь в работоспособности своего стека. Создайте отдельный verify.yml, который будет проверять работоспособность интеграции всех инструментов между ними.
4. Выложите свои roles в репозитории.

В качестве решения пришлите ссылки и скриншоты этапов выполнения задания.

---

### Как оформить ДЗ?

Выполненное домашнее задание пришлите ссылкой на .md-файл в вашем репозитории.
