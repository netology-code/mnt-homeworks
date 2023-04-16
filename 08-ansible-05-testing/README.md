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
root@ubuntu:~$ molecule --version
molecule 4.0.1 using python 3.10
    ansible:2.13.3
    delegated:4.0.1 from molecule
    docker:2.0.0 from molecule_docker requiring collections: community.docker>=3.0.0-a2
root@ubuntu:~$
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

Тест <b>molecule</b>:

```console
root@ubuntu:~/ansible-clickhouse$ molecule test -s centos_7
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
root@ubuntu:~/ansible-clickhouse$
'''

---


### 2. Перейдите в каталог с ролью **vector-role** и создайте сценарий тестирования по умолчанию при помощи `molecule init scenario --driver-name docker`.

> Сценарий по умолчанию - **default**
```console
root@ubuntu:~/vector-role$ molecule init scenario --driver-name docker
INFO     Initializing new scenario default...
INFO     Initialized scenario in /home/vector-role/molecule/default successfully.
root@ubuntu:~/vector-role$
```

---

### 3. Добавьте несколько разных дистрибутивов (centos:8, ubuntu:latest) для инстансов и протестируйте роль, исправьте найденные ошибки, если они есть.

Для работы в **Docker** были использованы готовые образы за авторством [pycontribs](https://hub.docker.com/u/pycontribs):
  - [CentOS](https://hub.docker.com/r/pycontribs/centos/tags) (доступные теги: `7`, `8`) - `docker.io/pycontribs/centos`
  - [Ubuntu](https://hub.docker.com/r/pycontribs/ubuntu/tags) (доступен только тег `latest`) - `docker.io/pycontribs/ubuntu`

Итоговый файл настройки **molecule**

```yaml
---
dependency:
  name: galaxy
driver:
  name: docker
  options:
    D: true
    vv: true
platforms:
  - name: centos7
    image: docker.io/pycontribs/centos:7
    pre_build_image: true
  - name: centos8
    image: docker.io/pycontribs/centos:8
    pre_build_image: true
  - name: ubuntu
    image: docker.io/pycontribs/ubuntu:latest
    pre_build_image: true
provisioner:
  name: ansible
  options:
    D: true
    vv: true
  playbooks:
    converge: ../resources/converge.yml
    verify: ../resources/verify.yml
verifier:
  name: ansible
...
```

---

### 4. Добавьте несколько assert'ов в verify.yml файл для проверки работоспособности vector-role (проверка, что конфиг валидный, проверка успешности запуска, etc). Запустите тестирование роли повторно и проверьте, что оно прошло успешно.

Готовый **playbook** проверок:

```yaml
---
- name: Verify vector installation
  hosts: all
  gather_facts: false
  tasks:
  - name: Get information about vector
    ansible.builtin.command: systemctl show vector
    register: srv_res
    changed_when: false
  - name: Assert vector service
    ansible.builtin.assert:
      that:
        - srv_res.rc == 0
        - "'ActiveState=active' in srv_res.stdout_lines"
        - "'LoadState=loaded' in srv_res.stdout_lines"
        - "'SubState=running' in srv_res.stdout_lines"
  - name: Validate vector configuration
    ansible.builtin.command: vector validate
    register: vld_res
    changed_when: false
  - name: Assert vector healthcheck
    ansible.builtin.assert:
      that:
        - vld_res.rc == 0
        - "'Validated' == {{ vld_res.stdout_lines | map('trim') | list }}[-1]"
...
```

В проверках определяется текущий статус сервиса **vector** - загружен, активен (автозапуск) и запущен.
Далее выполняется верификация конфигурационного файла и самоконтроль **Vector**.

По хорошему статус служб лучше проверять специальным модулем `ansible.builtin.service_facts` например так:
```yaml
    - name: 'Gather Local Services'
      ansible.builtin.service_facts:
      become: true
    - name: 'Assert Vector Service'
      ansible.builtin.assert:
        that:
          - "'{{ service_name }}' in ansible_facts.services"
          - "'running' == ansible_facts.services[service_name].state"
          - "'enabled' == ansible_facts.services[service_name].status"
```
> Переменная `service_name` должна содержать имя проверяемого сервиса
К сожалению модуль **service_facts** не может определить установленный через скрипт сервис **vector**

Лог тестирования роли с использованием <b>Molecule</b>:
```console
root@ubuntu:~/vector-role$ molecule test
INFO     default scenario test matrix: dependency, lint, cleanup, destroy, syntax, create, prepare, converge, idempotence, side_effect, verify, cleanup, destroy
INFO     Performing prerun with role_name_check=0...
INFO     Set ANSIBLE_LIBRARY=/home/.cache/ansible-compat/f5bcd7/modules:/home/.ansible/plugins/modules:/usr/share/ansible/plugins/modules
INFO     Set ANSIBLE_COLLECTIONS_PATH=/home/.cache/ansible-compat/f5bcd7/collections:/home/.ansible/collections:/usr/share/ansible/collections
INFO     Set ANSIBLE_ROLES_PATH=/home/.cache/ansible-compat/f5bcd7/roles:/home/.ansible/roles:/usr/share/ansible/roles:/etc/ansible/roles
INFO     Using /home/.cache/ansible-compat/f5bcd7/roles/artem_shtepa.vector_role symlink to current repository in order to enable Ansible to find the role using its expected full name.
INFO     Running default > dependency
WARNING  Skipping, missing the requirements file.
WARNING  Skipping, missing the requirements file.
INFO     Running default > lint
INFO     Lint is disabled.
INFO     Running default > cleanup
WARNING  Skipping, cleanup playbook not configured.
INFO     Running default > destroy
INFO     Sanity checks: 'docker'

PLAY [Destroy] *****************************************************************

TASK [Destroy molecule instance(s)] ********************************************
changed: [localhost] => (item=centos7)
changed: [localhost] => (item=centos8)
changed: [localhost] => (item=ubuntu)

TASK [Wait for instance(s) deletion to complete] *******************************
ok: [localhost] => (item=centos7)
ok: [localhost] => (item=centos8)
ok: [localhost] => (item=ubuntu)

TASK [Delete docker networks(s)] ***********************************************

PLAY RECAP *********************************************************************
localhost                  : ok=2    changed=1    unreachable=0    failed=0    skipped=1    rescued=0    ignored=0

INFO     Running default > syntax

playbook: /home/vector-role/molecule/resources/converge.yml
INFO     Running default > create

PLAY [Create] ******************************************************************

TASK [Log into a Docker registry] **********************************************
skipping: [localhost] => (item=None)
skipping: [localhost] => (item=None)
skipping: [localhost] => (item=None)
skipping: [localhost]

TASK [Check presence of custom Dockerfiles] ************************************
ok: [localhost] => (item={'image': 'docker.io/pycontribs/centos:7', 'name': 'centos7', 'pre_build_image': True})
ok: [localhost] => (item={'image': 'docker.io/pycontribs/centos:8', 'name': 'centos8', 'pre_build_image': True})
ok: [localhost] => (item={'image': 'docker.io/pycontribs/ubuntu:latest', 'name': 'ubuntu', 'pre_build_image': True})

TASK [Create Dockerfiles from image names] *************************************
skipping: [localhost] => (item={'image': 'docker.io/pycontribs/centos:7', 'name': 'centos7', 'pre_build_image': True})
skipping: [localhost] => (item={'image': 'docker.io/pycontribs/centos:8', 'name': 'centos8', 'pre_build_image': True})
skipping: [localhost] => (item={'image': 'docker.io/pycontribs/ubuntu:latest', 'name': 'ubuntu', 'pre_build_image': True})

TASK [Discover local Docker images] ********************************************
ok: [localhost] => (item={'changed': False, 'skipped': True, 'skip_reason': 'Conditional result was False', 'item': {'image': 'docker.io/pycontribs/centos:7', 'name': 'centos7', 'pre_build_image': True}, 'ansible_loop_var': 'item', 'i': 0, 'ansible_index_var': 'i'})
ok: [localhost] => (item={'changed': False, 'skipped': True, 'skip_reason': 'Conditional result was False', 'item': {'image': 'docker.io/pycontribs/centos:8', 'name': 'centos8', 'pre_build_image': True}, 'ansible_loop_var': 'item', 'i': 1, 'ansible_index_var': 'i'})
ok: [localhost] => (item={'changed': False, 'skipped': True, 'skip_reason': 'Conditional result was False', 'item': {'image': 'docker.io/pycontribs/ubuntu:latest', 'name': 'ubuntu', 'pre_build_image': True}, 'ansible_loop_var': 'item', 'i': 2, 'ansible_index_var': 'i'})

TASK [Build an Ansible compatible image (new)] *********************************
skipping: [localhost] => (item=molecule_local/docker.io/pycontribs/centos:7)
skipping: [localhost] => (item=molecule_local/docker.io/pycontribs/centos:8)
skipping: [localhost] => (item=molecule_local/docker.io/pycontribs/ubuntu:latest)

TASK [Create docker network(s)] ************************************************

TASK [Determine the CMD directives] ********************************************
ok: [localhost] => (item={'image': 'docker.io/pycontribs/centos:7', 'name': 'centos7', 'pre_build_image': True})
ok: [localhost] => (item={'image': 'docker.io/pycontribs/centos:8', 'name': 'centos8', 'pre_build_image': True})
ok: [localhost] => (item={'image': 'docker.io/pycontribs/ubuntu:latest', 'name': 'ubuntu', 'pre_build_image': True})

TASK [Create molecule instance(s)] *********************************************
changed: [localhost] => (item=centos7)
changed: [localhost] => (item=centos8)
changed: [localhost] => (item=ubuntu)

TASK [Wait for instance(s) creation to complete] *******************************
changed: [localhost] => (item={'failed': 0, 'started': 1, 'finished': 0, 'ansible_job_id': '694370910668.38264', 'results_file': '/home/.ansible_async/694370910668.38264', 'changed': True, 'item': {'image': 'docker.io/pycontribs/centos:7', 'name': 'centos7', 'pre_build_image': True}, 'ansible_loop_var': 'item'})
FAILED - RETRYING: [localhost]: Wait for instance(s) creation to complete (300 retries left).
changed: [localhost] => (item={'failed': 0, 'started': 1, 'finished': 0, 'ansible_job_id': '505681089154.38290', 'results_file': '/home/.ansible_async/505681089154.38290', 'changed': True, 'item': {'image': 'docker.io/pycontribs/centos:8', 'name': 'centos8', 'pre_build_image': True}, 'ansible_loop_var': 'item'})
changed: [localhost] => (item={'failed': 0, 'started': 1, 'finished': 0, 'ansible_job_id': '681996805273.38323', 'results_file': '/home/.ansible_async/681996805273.38323', 'changed': True, 'item': {'image': 'docker.io/pycontribs/ubuntu:latest', 'name': 'ubuntu', 'pre_build_image': True}, 'ansible_loop_var': 'item'})

PLAY RECAP *********************************************************************
localhost                  : ok=5    changed=2    unreachable=0    failed=0    skipped=4    rescued=0    ignored=0

INFO     Running default > prepare
WARNING  Skipping, prepare playbook not configured.
INFO     Running default > converge

PLAY [Converge] ****************************************************************

TASK [Gathering Facts] *********************************************************
ok: [ubuntu]
ok: [centos8]
ok: [centos7]

TASK [Detect python3 version] **************************************************
ok: [centos8]
ok: [ubuntu]
ok: [centos7]

TASK [Set python version of script to 3] ***************************************
skipping: [centos7]
ok: [centos8]
ok: [ubuntu]

TASK [Download SystemD replacer v3] ********************************************
skipping: [centos7]
changed: [ubuntu]
changed: [centos8]

TASK [Download SystemD replacer v2] ********************************************
skipping: [centos8]
skipping: [ubuntu]
changed: [centos7]

TASK [Create systemd directories] **********************************************
--- before
+++ after
@@ -1,4 +1,4 @@
 {
     "path": "/run/systemd/system",
-    "state": "absent"
+    "state": "directory"
 }

changed: [centos7] => (item=/run/systemd/system)
--- before
+++ after
@@ -1,4 +1,4 @@
 {
     "path": "/run/systemd/system",
-    "state": "absent"
+    "state": "directory"
 }

changed: [centos8] => (item=/run/systemd/system)
--- before
+++ after
@@ -1,4 +1,4 @@
 {
     "path": "/run/systemd/system",
-    "state": "absent"
+    "state": "directory"
 }

changed: [ubuntu] => (item=/run/systemd/system)
ok: [centos7] => (item=/usr/lib/systemd/system)
ok: [centos8] => (item=/usr/lib/systemd/system)
--- before
+++ after
@@ -1,4 +1,4 @@
 {
     "path": "/usr/lib/systemd/system",
-    "state": "absent"
+    "state": "directory"
 }

changed: [ubuntu] => (item=/usr/lib/systemd/system)

TASK [Replace systemctl] *******************************************************
changed: [centos7]
changed: [ubuntu]
changed: [centos8]

TASK [ReCollect system info] ***************************************************
ok: [centos8]
ok: [ubuntu]
ok: [centos7]

TASK [Get Clickhouse IP from docker engine] ************************************
ok: [centos7 -> localhost]
ok: [centos8 -> localhost]
ok: [ubuntu -> localhost]

TASK [Set Clickhouse IP to facts] **********************************************
ok: [centos7]
ok: [centos8]
ok: [ubuntu]

TASK [Include vector-role] *****************************************************

TASK [vector-role : Download distrib] ******************************************
changed: [ubuntu]
changed: [centos8]
changed: [centos7]

TASK [vector-role : Create distrib directory] **********************************
--- before
+++ after
@@ -1,4 +1,4 @@
 {
     "path": "/root/vector",
-    "state": "absent"
+    "state": "directory"
 }

changed: [ubuntu]
--- before
+++ after
@@ -1,4 +1,4 @@
 {
     "path": "/root/vector",
-    "state": "absent"
+    "state": "directory"
 }

changed: [centos7]
--- before
+++ after
@@ -1,4 +1,4 @@
 {
     "path": "/root/vector",
-    "state": "absent"
+    "state": "directory"
 }

changed: [centos8]

TASK [vector-role : Unpack vector distrib by unarchive] ************************
changed: [centos8]
changed: [ubuntu]
changed: [centos7]

TASK [vector-role : Install vector executable] *********************************
changed: [centos8]
changed: [centos7]
changed: [ubuntu]

TASK [vector-role : Create vector directories] *********************************
--- before
+++ after
@@ -1,4 +1,4 @@
 {
     "path": "/var/lib/vector",
-    "state": "absent"
+    "state": "directory"
 }

changed: [centos7] => (item=/var/lib/vector)
--- before
+++ after
@@ -1,4 +1,4 @@
 {
     "path": "/var/lib/vector",
-    "state": "absent"
+    "state": "directory"
 }

changed: [centos8] => (item=/var/lib/vector)
--- before
+++ after
@@ -1,4 +1,4 @@
 {
     "path": "/var/lib/vector",
-    "state": "absent"
+    "state": "directory"
 }

changed: [ubuntu] => (item=/var/lib/vector)
--- before
+++ after
@@ -1,4 +1,4 @@
 {
     "path": "/etc/vector",
-    "state": "absent"
+    "state": "directory"
 }

changed: [centos7] => (item=/etc/vector)
--- before
+++ after
@@ -1,4 +1,4 @@
 {
     "path": "/etc/vector",
-    "state": "absent"
+    "state": "directory"
 }

changed: [centos8] => (item=/etc/vector)
--- before
+++ after
@@ -1,4 +1,4 @@
 {
     "path": "/etc/vector",
-    "state": "absent"
+    "state": "directory"
 }

changed: [ubuntu] => (item=/etc/vector)

TASK [vector-role : Create test directory] *************************************
--- before
+++ after
@@ -1,4 +1,4 @@
 {
     "path": "/root/test",
-    "state": "absent"
+    "state": "directory"
 }

changed: [centos7]
--- before
+++ after
@@ -1,4 +1,4 @@
 {
     "path": "/root/test",
-    "state": "absent"
+    "state": "directory"
 }

changed: [centos8]
--- before
+++ after
@@ -1,4 +1,4 @@
 {
     "path": "/root/test",
-    "state": "absent"
+    "state": "directory"
 }

changed: [ubuntu]

TASK [vector-role : Install vector configuration] ******************************
--- before
+++ after: /home/.ansible/tmp/ansible-local-38634vd4fbr1r/tmp2m12gnzi/vector.toml.j2
@@ -0,0 +1,24 @@
+# Set global options
+data_dir = "/var/lib/vector"
+
+# Vector's API (disabled by default)
+# Enable and try it out with the `vector top` command
+[api]
+enabled = true
+address = "0.0.0.0:8686"
+
+[sources.test_log]
+type = "file"
+ignore_older_secs = 600
+include = [ "/root/test/*.log" ]
+read_from = "beginning"
+
+[sinks.clickhouse]
+type = "clickhouse"
+inputs = [ "test_log" ]
+database = "logs"
+endpoint = "http://172.17.0.2:8123"
+table = "file_log"
+compression = "gzip"
+auth = { user = "user", password = "userlog", strategy = "basic" }
+skip_unknown_fields = true

changed: [centos7]
--- before
+++ after: /home/.ansible/tmp/ansible-local-38634vd4fbr1r/tmpvgzhew_n/vector.toml.j2
@@ -0,0 +1,24 @@
+# Set global options
+data_dir = "/var/lib/vector"
+
+# Vector's API (disabled by default)
+# Enable and try it out with the `vector top` command
+[api]
+enabled = true
+address = "0.0.0.0:8686"
+
+[sources.test_log]
+type = "file"
+ignore_older_secs = 600
+include = [ "/root/test/*.log" ]
+read_from = "beginning"
+
+[sinks.clickhouse]
+type = "clickhouse"
+inputs = [ "test_log" ]
+database = "logs"
+endpoint = "http://172.17.0.2:8123"
+table = "file_log"
+compression = "gzip"
+auth = { user = "user", password = "userlog", strategy = "basic" }
+skip_unknown_fields = true

changed: [ubuntu]
--- before
+++ after: /home/.ansible/tmp/ansible-local-38634vd4fbr1r/tmpdsjgvgmu/vector.toml.j2
@@ -0,0 +1,24 @@
+# Set global options
+data_dir = "/var/lib/vector"
+
+# Vector's API (disabled by default)
+# Enable and try it out with the `vector top` command
+[api]
+enabled = true
+address = "0.0.0.0:8686"
+
+[sources.test_log]
+type = "file"
+ignore_older_secs = 600
+include = [ "/root/test/*.log" ]
+read_from = "beginning"
+
+[sinks.clickhouse]
+type = "clickhouse"
+inputs = [ "test_log" ]
+database = "logs"
+endpoint = "http://172.17.0.2:8123"
+table = "file_log"
+compression = "gzip"
+auth = { user = "user", password = "userlog", strategy = "basic" }
+skip_unknown_fields = true

changed: [centos8]

TASK [vector-role : Install vector service file] *******************************
--- before
+++ after: /home/.ansible/tmp/ansible-local-38634vd4fbr1r/tmp9t21ccx1/vector.service.j2
@@ -0,0 +1,16 @@
+[Unit]
+Description=Vector
+Documentation=https://vector.dev
+After=network-online.target
+Requires=network-online.target
+
+[Service]
+ExecStart=/usr/bin/vector -c /etc/vector/vector.toml
+ExecReload=/usr/bin/vector -c /etc/vector/vector.toml validate
+ExecReload=/bin/kill -HUP $MAINPID
+Restart=no
+AmbientCapabilities=CAP_NET_BIND_SERVICE
+EnvironmentFile=-/etc/default/vector
+
+[Install]
+WantedBy=multi-user.target

changed: [centos7]
--- before
+++ after: /home/.ansible/tmp/ansible-local-38634vd4fbr1r/tmpx5rqhlvm/vector.service.j2
@@ -0,0 +1,16 @@
+[Unit]
+Description=Vector
+Documentation=https://vector.dev
+After=network-online.target
+Requires=network-online.target
+
+[Service]
+ExecStart=/usr/bin/vector -c /etc/vector/vector.toml
+ExecReload=/usr/bin/vector -c /etc/vector/vector.toml validate
+ExecReload=/bin/kill -HUP $MAINPID
+Restart=no
+AmbientCapabilities=CAP_NET_BIND_SERVICE
+EnvironmentFile=-/etc/default/vector
+
+[Install]
+WantedBy=multi-user.target

changed: [centos8]
--- before
+++ after: /home/.ansible/tmp/ansible-local-38634vd4fbr1r/tmpyx13qio2/vector.service.j2
@@ -0,0 +1,16 @@
+[Unit]
+Description=Vector
+Documentation=https://vector.dev
+After=network-online.target
+Requires=network-online.target
+
+[Service]
+ExecStart=/usr/bin/vector -c /etc/vector/vector.toml
+ExecReload=/usr/bin/vector -c /etc/vector/vector.toml validate
+ExecReload=/bin/kill -HUP $MAINPID
+Restart=no
+AmbientCapabilities=CAP_NET_BIND_SERVICE
+EnvironmentFile=-/etc/default/vector
+
+[Install]
+WantedBy=multi-user.target

changed: [ubuntu]

TASK [vector-role : Enable vector service] *************************************
changed: [ubuntu]
changed: [centos8]
changed: [centos7]

RUNNING HANDLER [vector-role : Start vector service] ***************************
changed: [centos8]
changed: [ubuntu]
changed: [centos7]

PLAY RECAP *********************************************************************
centos7                    : ok=18   changed=13   unreachable=0    failed=0    skipped=2    rescued=0    ignored=0
centos8                    : ok=19   changed=13   unreachable=0    failed=0    skipped=1    rescued=0    ignored=0
ubuntu                     : ok=19   changed=13   unreachable=0    failed=0    skipped=1    rescued=0    ignored=0

INFO     Running default > idempotence

PLAY [Converge] ****************************************************************

TASK [Gathering Facts] *********************************************************
ok: [centos8]
ok: [ubuntu]
ok: [centos7]

TASK [Detect python3 version] **************************************************
ok: [ubuntu]
ok: [centos8]
ok: [centos7]

TASK [Set python version of script to 3] ***************************************
skipping: [centos7]
ok: [centos8]
ok: [ubuntu]

TASK [Download SystemD replacer v3] ********************************************
skipping: [centos7]
ok: [ubuntu]
ok: [centos8]

TASK [Download SystemD replacer v2] ********************************************
skipping: [centos8]
skipping: [ubuntu]
ok: [centos7]

TASK [Create systemd directories] **********************************************
ok: [centos7] => (item=/run/systemd/system)
ok: [centos8] => (item=/run/systemd/system)
ok: [ubuntu] => (item=/run/systemd/system)
ok: [centos7] => (item=/usr/lib/systemd/system)
ok: [ubuntu] => (item=/usr/lib/systemd/system)
ok: [centos8] => (item=/usr/lib/systemd/system)

TASK [Replace systemctl] *******************************************************
ok: [centos7]
ok: [ubuntu]
ok: [centos8]

TASK [ReCollect system info] ***************************************************
ok: [centos8]
ok: [ubuntu]
ok: [centos7]

TASK [Get Clickhouse IP from docker engine] ************************************
ok: [centos7 -> localhost]
ok: [centos8 -> localhost]
ok: [ubuntu -> localhost]

TASK [Set Clickhouse IP to facts] **********************************************
ok: [centos7]
ok: [centos8]
ok: [ubuntu]

TASK [Include vector-role] *****************************************************

TASK [vector-role : Download distrib] ******************************************
ok: [centos7]
ok: [ubuntu]
ok: [centos8]

TASK [vector-role : Create distrib directory] **********************************
ok: [centos7]
ok: [centos8]
ok: [ubuntu]

TASK [vector-role : Unpack vector distrib by unarchive] ************************
ok: [ubuntu]
ok: [centos8]
ok: [centos7]

TASK [vector-role : Install vector executable] *********************************
ok: [centos7]
ok: [ubuntu]
ok: [centos8]

TASK [vector-role : Create vector directories] *********************************
ok: [centos7] => (item=/var/lib/vector)
ok: [ubuntu] => (item=/var/lib/vector)
ok: [centos8] => (item=/var/lib/vector)
ok: [centos7] => (item=/etc/vector)
ok: [centos8] => (item=/etc/vector)
ok: [ubuntu] => (item=/etc/vector)

TASK [vector-role : Create test directory] *************************************
ok: [centos7]
ok: [centos8]
ok: [ubuntu]

TASK [vector-role : Install vector configuration] ******************************
ok: [centos7]
ok: [centos8]
ok: [ubuntu]

TASK [vector-role : Install vector service file] *******************************
ok: [centos7]
ok: [centos8]
ok: [ubuntu]

TASK [vector-role : Enable vector service] *************************************
ok: [ubuntu]
ok: [centos8]
ok: [centos7]

PLAY RECAP *********************************************************************
centos7                    : ok=17   changed=0    unreachable=0    failed=0    skipped=2    rescued=0    ignored=0
centos8                    : ok=18   changed=0    unreachable=0    failed=0    skipped=1    rescued=0    ignored=0
ubuntu                     : ok=18   changed=0    unreachable=0    failed=0    skipped=1    rescued=0    ignored=0

INFO     Idempotence completed successfully.
INFO     Running default > side_effect
WARNING  Skipping, side effect playbook not configured.
INFO     Running default > verify
INFO     Running Ansible Verifier

PLAY [Verify vector installation] **********************************************

TASK [Get information about vector] ********************************************
ok: [centos8]
ok: [ubuntu]
ok: [centos7]

TASK [Assert vector service] ***************************************************
ok: [centos7] => {
    "changed": false,
    "msg": "All assertions passed"
}
ok: [centos8] => {
    "changed": false,
    "msg": "All assertions passed"
}
ok: [ubuntu] => {
    "changed": false,
    "msg": "All assertions passed"
}

TASK [Validate vector configuration] *******************************************
ok: [centos8]
ok: [ubuntu]
ok: [centos7]

TASK [Assert vector healthcheck] ***********************************************
ok: [centos7] => {
    "changed": false,
    "msg": "All assertions passed"
}
ok: [centos8] => {
    "changed": false,
    "msg": "All assertions passed"
}
ok: [ubuntu] => {
    "changed": false,
    "msg": "All assertions passed"
}

PLAY RECAP *********************************************************************
centos7                    : ok=4    changed=0    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0
centos8                    : ok=4    changed=0    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0
ubuntu                     : ok=4    changed=0    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0

INFO     Verifier completed successfully.
INFO     Running default > cleanup
WARNING  Skipping, cleanup playbook not configured.
INFO     Running default > destroy

PLAY [Destroy] *****************************************************************

TASK [Destroy molecule instance(s)] ********************************************
changed: [localhost] => (item=centos7)
changed: [localhost] => (item=centos8)
changed: [localhost] => (item=ubuntu)

TASK [Wait for instance(s) deletion to complete] *******************************
FAILED - RETRYING: [localhost]: Wait for instance(s) deletion to complete (300 retries left).
changed: [localhost] => (item=centos7)
changed: [localhost] => (item=centos8)
changed: [localhost] => (item=ubuntu)

TASK [Delete docker networks(s)] ***********************************************

PLAY RECAP *********************************************************************
localhost                  : ok=2    changed=2    unreachable=0    failed=0    skipped=1    rescued=0    ignored=0

INFO     Pruning extra files from scenario ephemeral directory
root@ubuntu:~/vector-role$
```
</details>

---

### 5. Добавьте новый тег на коммит с рабочим сценарием в соответствии с семантическим версионированием.

Для успешного тестирования роли был необходим функционирующий экземпляр **Clickhouse**, для чего выполнялось его расзворачивание в отдельном контейнере **docker**

Файл [манифеста](clickhouse/docker-compose.yml) **Docker compose**

```yaml
---
version: "2.4"
services:
  clickhouse_vm:
    image: pycontribs/centos:7
    container_name: clickhouse-01
    ports:
      - "9000:9000"
      - "8123:8123"
    tty: true
    network_mode: bridge
...
```

После создания контейнера, на нём применена роль [Ansible-clickhouse](https://github.com/NamorNinayzuk/ansible-clickhouse).

---

## Tox

> 1. Добавьте в директорию с vector-role файлы из [директории](./example)
> 1. Запустите `docker run --privileged=True -v <path_to_repo>:/opt/vector-role -w /opt/vector-role -it aragast/netology:latest /bin/bash`, где path_to_repo - путь до корня репозитория с vector-role на вашей файловой системе.
> 1. Внутри контейнера выполните команду `tox`, посмотрите на вывод.
> 1. Создайте облегчённый сценарий для `molecule` с драйвером `molecule_podman`. Проверьте его на исполнимость.
> 1. Пропишите правильную команду в `tox.ini` для того чтобы запускался облегчённый сценарий.
> 1. Запустите команду `tox`. Убедитесь, что всё отработало успешно.
> 1. Добавьте новый тег на коммит с рабочим сценарием в соответствии с семантическим версионированием.
> 
> После выполнения у вас должно получится два сценария molecule и один tox.ini файл в репозитории.
> Ссылка на репозиторий являются ответами на домашнее задание.
> Не забудьте указать в ответе теги решений Tox и Molecule заданий.
Используемое окружение:

```console
root@ubuntu:~/vector-role$ molecule --version
molecule 4.0.1 using python 3.10
    ansible:2.13.3
    delegated:4.0.1 from molecule
    docker:2.0.0 from molecule_docker requiring collections: community.docker>=3.0.0-a2
    podman:2.0.2 from molecule_podman requiring collections: containers.podman>=1.7.0 ansible.posix>=1.3.0
root@ubuntu:~/vector-role$
```

Чтобы не множить остановленные после завершения работы **Docker** контейнеры в строку запуска добавлен параметр `--rm`

Первый запуск **Tox** внутри контейнера:

```console
root@ubuntu:~/vector-role$ docker run --privileged=True --rm -v ~/vector-role:/opt/vector-role -w /opt/vector-role -it aragast/netology:latest /bin/bash
[root@f8b40ec440dc vector-role]# tox
py37-ansible210 create: /opt/vector-role/.tox/py37-ansible210
py37-ansible210 installdeps: -rtox-requirements.txt, ansible<3.0
py37-ansible210 installed: ansible==2.10.7,ansible-base==2.10.17,ansible-compat==1.0.0,ansible-lint==5.1.3,arrow==1.2.3,bcrypt==4.0.0,binaryornot==0.4.4,bracex==2.3.post1,cached-property==1.5.2,Cerberus==1.3.2,certifi==2022.6.15.1,cffi==1.15.1,chardet==5.0.0,charset-normalizer==2.1.1,click==8.1.3,click-help-colors==0.9.1,commonmark==0.9.1,cookiecutter==2.1.1,cryptography==38.0.1,distro==1.7.0,enrich==1.2.7,idna==3.3,importlib-metadata==4.12.0,Jinja2==3.1.2,jinja2-time==0.2.0,jmespath==1.0.1,lxml==4.9.1,MarkupSafe==2.1.1,molecule==3.4.0,molecule-podman==1.0.1,packaging==21.3,paramiko==2.11.0,pathspec==0.10.1,pluggy==0.13.1,pycparser==2.21,Pygments==2.13.0,PyNaCl==1.5.0,pyparsing==3.0.9,python-dateutil==2.8.2,python-slugify==6.1.2,PyYAML==5.4.1,requests==2.28.1,rich==12.5.1,ruamel.yaml==0.17.21,ruamel.yaml.clib==0.2.6,selinux==0.2.1,six==1.16.0,subprocess-tee==0.3.5,tenacity==8.0.1,text-unidecode==1.3,typing_extensions==4.3.0,urllib3==1.26.12,wcmatch==8.4,yamllint==1.26.3,zipp==3.8.1
py37-ansible210 run-test-pre: PYTHONHASHSEED='1189971644'
py37-ansible210 run-test: commands[0] | molecule test -s compatibility --destroy always
CRITICAL 'molecule/compatibility/molecule.yml' glob failed.  Exiting.
ERROR: InvocationError for command /opt/vector-role/.tox/py37-ansible210/bin/molecule test -s compatibility --destroy always (exited with code 1)
py37-ansible30 create: /opt/vector-role/.tox/py37-ansible30
py37-ansible30 installdeps: -rtox-requirements.txt, ansible<3.1
py37-ansible30 installed: ansible==3.0.0,ansible-base==2.10.17,ansible-compat==1.0.0,ansible-lint==5.1.3,arrow==1.2.3,bcrypt==4.0.0,binaryornot==0.4.4,bracex==2.3.post1,cached-property==1.5.2,Cerberus==1.3.2,certifi==2022.6.15.1,cffi==1.15.1,chardet==5.0.0,charset-normalizer==2.1.1,click==8.1.3,click-help-colors==0.9.1,commonmark==0.9.1,cookiecutter==2.1.1,cryptography==38.0.1,distro==1.7.0,enrich==1.2.7,idna==3.3,importlib-metadata==4.12.0,Jinja2==3.1.2,jinja2-time==0.2.0,jmespath==1.0.1,lxml==4.9.1,MarkupSafe==2.1.1,molecule==3.4.0,molecule-podman==1.0.1,packaging==21.3,paramiko==2.11.0,pathspec==0.10.1,pluggy==0.13.1,pycparser==2.21,Pygments==2.13.0,PyNaCl==1.5.0,pyparsing==3.0.9,python-dateutil==2.8.2,python-slugify==6.1.2,PyYAML==5.4.1,requests==2.28.1,rich==12.5.1,ruamel.yaml==0.17.21,ruamel.yaml.clib==0.2.6,selinux==0.2.1,six==1.16.0,subprocess-tee==0.3.5,tenacity==8.0.1,text-unidecode==1.3,typing_extensions==4.3.0,urllib3==1.26.12,wcmatch==8.4,yamllint==1.26.3,zipp==3.8.1
py37-ansible30 run-test-pre: PYTHONHASHSEED='1189971644'
py37-ansible30 run-test: commands[0] | molecule test -s compatibility --destroy always
CRITICAL 'molecule/compatibility/molecule.yml' glob failed.  Exiting.
ERROR: InvocationError for command /opt/vector-role/.tox/py37-ansible30/bin/molecule test -s compatibility --destroy always (exited with code 1)
py39-ansible210 create: /opt/vector-role/.tox/py39-ansible210
py39-ansible210 installdeps: -rtox-requirements.txt, ansible<3.0
py39-ansible210 installed: ansible==2.10.7,ansible-base==2.10.17,ansible-compat==2.2.0,ansible-lint==5.1.3,arrow==1.2.3,attrs==22.1.0,bcrypt==4.0.0,binaryornot==0.4.4,bracex==2.3.post1,Cerberus==1.3.2,certifi==2022.6.15.1,cffi==1.15.1,chardet==5.0.0,charset-normalizer==2.1.1,click==8.1.3,click-help-colors==0.9.1,commonmark==0.9.1,cookiecutter==2.1.1,cryptography==38.0.1,distro==1.7.0,enrich==1.2.7,idna==3.3,Jinja2==3.1.2,jinja2-time==0.2.0,jmespath==1.0.1,jsonschema==4.16.0,lxml==4.9.1,MarkupSafe==2.1.1,molecule==3.4.0,molecule-podman==1.0.1,packaging==21.3,paramiko==2.11.0,pathspec==0.10.1,pluggy==0.13.1,pycparser==2.21,Pygments==2.13.0,PyNaCl==1.5.0,pyparsing==3.0.9,pyrsistent==0.18.1,python-dateutil==2.8.2,python-slugify==6.1.2,PyYAML==5.4.1,requests==2.28.1,rich==12.5.1,ruamel.yaml==0.17.21,ruamel.yaml.clib==0.2.6,selinux==0.2.1,six==1.16.0,subprocess-tee==0.3.5,tenacity==8.0.1,text-unidecode==1.3,urllib3==1.26.12,wcmatch==8.4,yamllint==1.26.3
py39-ansible210 run-test-pre: PYTHONHASHSEED='1189971644'
py39-ansible210 run-test: commands[0] | molecule test -s compatibility --destroy always
CRITICAL 'molecule/compatibility/molecule.yml' glob failed.  Exiting.
ERROR: InvocationError for command /opt/vector-role/.tox/py39-ansible210/bin/molecule test -s compatibility --destroy always (exited with code 1)
py39-ansible30 create: /opt/vector-role/.tox/py39-ansible30
py39-ansible30 installdeps: -rtox-requirements.txt, ansible<3.1
py39-ansible30 installed: ansible==3.0.0,ansible-base==2.10.17,ansible-compat==2.2.0,ansible-lint==5.1.3,arrow==1.2.3,attrs==22.1.0,bcrypt==4.0.0,binaryornot==0.4.4,bracex==2.3.post1,Cerberus==1.3.2,certifi==2022.6.15.1,cffi==1.15.1,chardet==5.0.0,charset-normalizer==2.1.1,click==8.1.3,click-help-colors==0.9.1,commonmark==0.9.1,cookiecutter==2.1.1,cryptography==38.0.1,distro==1.7.0,enrich==1.2.7,idna==3.3,Jinja2==3.1.2,jinja2-time==0.2.0,jmespath==1.0.1,jsonschema==4.16.0,lxml==4.9.1,MarkupSafe==2.1.1,molecule==3.4.0,molecule-podman==1.0.1,packaging==21.3,paramiko==2.11.0,pathspec==0.10.1,pluggy==0.13.1,pycparser==2.21,Pygments==2.13.0,PyNaCl==1.5.0,pyparsing==3.0.9,pyrsistent==0.18.1,python-dateutil==2.8.2,python-slugify==6.1.2,PyYAML==5.4.1,requests==2.28.1,rich==12.5.1,ruamel.yaml==0.17.21,ruamel.yaml.clib==0.2.6,selinux==0.2.1,six==1.16.0,subprocess-tee==0.3.5,tenacity==8.0.1,text-unidecode==1.3,urllib3==1.26.12,wcmatch==8.4,yamllint==1.26.3
py39-ansible30 run-test-pre: PYTHONHASHSEED='1189971644'
py39-ansible30 run-test: commands[0] | molecule test -s compatibility --destroy always
CRITICAL 'molecule/compatibility/molecule.yml' glob failed.  Exiting.
ERROR: InvocationError for command /opt/vector-role/.tox/py39-ansible30/bin/molecule test -s compatibility --destroy always (exited with code 1)
_______________________________________________________ summary ________________________________________________________
ERROR:   py37-ansible210: commands failed
ERROR:   py37-ansible30: commands failed
ERROR:   py39-ansible210: commands failed
ERROR:   py39-ansible30: commands failed
[root@f8b40ec440dc vector-role]#
```

> Так как **Docker** контейнер запускался с проброшеным внутрь каталогом роли (`-v ~/vector-role:/opt/vector-role`),
> то выполнение **Tox** создало кэш используемых окружений вне контейнера (каталог `~/vector-role/.tox`),
> что позволяет повторно их использовать даже после удаления и пересоздания контейнера (поэтому использование параметра `--rm` вполне оправдано)
Из сообщений видно, что все проверки **Tox** завершились одинаковой ошибкой, связанной с исполняемой командой,
а именно: `molecule test -s compatibility --destroy always`, что логично, потому что сценария `compatibility` в роли нет.

Инициализация нового сценария с драйвером **podman**

```console
root@ubuntu:~/vector-role$ molecule init scenario podman --driver-name podman
INFO     Initializing new scenario podman...
INFO     Initialized scenario in /home/vector-role/molecule/podman successfully.
root@ubuntu:~/vector-role$
```

Вывод работы <b>Tox</b>:

```console
[root@a906a0f6163d vector-role]# tox
py37-ansible210 installed: ansible==2.10.7,ansible-base==2.10.17,ansible-compat==1.0.0,ansible-lint==5.1.3,arrow==1.2.3,bcrypt==4.0.0,binaryornot==0.4.4,bracex==2.3.post1,cached-property==1.5.2,Cerberus==1.3.2,certifi==2022.6.15.1,cffi==1.15.1,chardet==5.0.0,charset-normalizer==2.1.1,click==8.1.3,click-help-colors==0.9.1,commonmark==0.9.1,cookiecutter==2.1.1,cryptography==38.0.1,distro==1.7.0,enrich==1.2.7,idna==3.3,importlib-metadata==4.12.0,Jinja2==3.1.2,jinja2-time==0.2.0,jmespath==1.0.1,lxml==4.9.1,MarkupSafe==2.1.1,molecule==3.4.0,molecule-podman==1.0.1,packaging==21.3,paramiko==2.11.0,pathspec==0.10.1,pluggy==0.13.1,pycparser==2.21,Pygments==2.13.0,PyNaCl==1.5.0,pyparsing==3.0.9,python-dateutil==2.8.2,python-slugify==6.1.2,PyYAML==5.4.1,requests==2.28.1,rich==12.5.1,ruamel.yaml==0.17.21,ruamel.yaml.clib==0.2.6,selinux==0.2.1,six==1.16.0,subprocess-tee==0.3.5,tenacity==8.0.1,text-unidecode==1.3,typing_extensions==4.3.0,urllib3==1.26.12,wcmatch==8.4,yamllint==1.26.3,zipp==3.8.1
py37-ansible210 run-test-pre: PYTHONHASHSEED='2945318393'
py37-ansible210 run-test: commands[0] | molecule test -s podman --destroy always
INFO     podman scenario test matrix: dependency, lint, cleanup, destroy, syntax, create, prepare, converge, idempotence, side_effect, verify, cleanup, destroy
INFO     Performing prerun...
WARNING  Failed to locate command: [Errno 2] No such file or directory: 'git': 'git'
INFO     Guessed /opt/vector-role as project root directory
INFO     Using /root/.cache/ansible-lint/b984a4/roles/artem_shtepa.vector_role symlink to current repository in order to enable Ansible to find the role using its expected full name.
INFO     Added ANSIBLE_ROLES_PATH=~/.ansible/roles:/usr/share/ansible/roles:/etc/ansible/roles:/root/.cache/ansible-lint/b984a4/roles
INFO     Running podman > dependency
WARNING  Skipping, missing the requirements file.
WARNING  Skipping, missing the requirements file.
INFO     Running podman > lint
INFO     Lint is disabled.
INFO     Running podman > cleanup
WARNING  Skipping, cleanup playbook not configured.
INFO     Running podman > destroy
INFO     Sanity checks: 'podman'

PLAY [Destroy] *****************************************************************

TASK [Destroy molecule instance(s)] ********************************************
changed: [localhost] => (item={'image': 'docker.io/pycontribs/centos:7', 'name': 'centos7', 'pre_build_image': True})

TASK [Wait for instance(s) deletion to complete] *******************************
changed: [localhost] => (item={'started': 1, 'finished': 0, 'ansible_job_id': '269176633897.3284', 'results_file': '/root/.ansible_async/269176633897.3284', 'changed': True, 'failed': False, 'item': {'image': 'docker.io/pycontribs/centos:7', 'name': 'centos7', 'pre_build_image': True}, 'ansible_loop_var': 'item'})

PLAY RECAP *********************************************************************
localhost                  : ok=2    changed=2    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0

INFO     Running podman > syntax

playbook: /opt/vector-role/molecule/resources/converge.yml
INFO     Running podman > create

PLAY [Create] ******************************************************************

TASK [get podman executable path] **********************************************
ok: [localhost]

TASK [save path to executable as fact] *****************************************
ok: [localhost]

TASK [Log into a container registry] *******************************************
skipping: [localhost] => (item="centos7 registry username: None specified")

TASK [Check presence of custom Dockerfiles] ************************************
ok: [localhost] => (item=Dockerfile: None specified)

TASK [Create Dockerfiles from image names] *************************************
skipping: [localhost] => (item="Dockerfile: None specified; Image: docker.io/pycontribs/centos:7")

TASK [Discover local Podman images] ********************************************
ok: [localhost] => (item=centos7)

TASK [Build an Ansible compatible image] ***************************************
skipping: [localhost] => (item=docker.io/pycontribs/centos:7)

TASK [Determine the CMD directives] ********************************************
ok: [localhost] => (item="centos7 command: None specified")

TASK [Remove possible pre-existing containers] *********************************
changed: [localhost]

TASK [Discover local podman networks] ******************************************
skipping: [localhost] => (item=centos7: None specified)

TASK [Create podman network dedicated to this scenario] ************************
skipping: [localhost]

TASK [Create molecule instance(s)] *********************************************
changed: [localhost] => (item=centos7)

TASK [Wait for instance(s) creation to complete] *******************************
failed: [localhost] (item=centos7) => {"ansible_job_id": "864829238242.3454", "ansible_loop_var": "item", "attempts": 1, "changed": true, "cmd": ["/usr/bin/podman", "run", "-d", "--name", "centos7", "--hostname=centos7", "docker.io/pycontribs/centos:7", "bash", "-c", "while true; do sleep 10000; done"], "delta": "0:00:00.047901", "end": "2022-09-11 11:34:41.767148", "finished": 1, "item": {"ansible_job_id": "864829238242.3454", "ansible_loop_var": "item", "changed": true, "failed": false, "finished": 0, "item": {"image": "docker.io/pycontribs/centos:7", "name": "centos7", "pre_build_image": true}, "results_file": "/root/.ansible_async/864829238242.3454", "started": 1}, "msg": "non-zero return code", "rc": 125, "start": "2022-09-11 11:34:41.719247", "stderr": "Error: invalid config provided: cannot set hostname when running in the host UTS namespace: invalid configuration", "stderr_lines": ["Error: invalid config provided: cannot set hostname when running in the host UTS namespace: invalid configuration"], "stdout": "", "stdout_lines": []}

PLAY RECAP *********************************************************************
localhost                  : ok=7    changed=2    unreachable=0    failed=1    skipped=5    rescued=0    ignored=0

CRITICAL Ansible return code was 2, command was: ['ansible-playbook', '--inventory', '/root/.cache/molecule/vector-role/podman/inventory', '--skip-tags', 'molecule-notest,notest', '/opt/vector-role/.tox/py37-ansible210/lib/python3.7/site-packages/molecule_podman/playbooks/create.yml']
WARNING  An error occurred during the test sequence action: 'create'. Cleaning up.
INFO     Running podman > cleanup
WARNING  Skipping, cleanup playbook not configured.
INFO     Running podman > destroy

PLAY [Destroy] *****************************************************************

TASK [Destroy molecule instance(s)] ********************************************
changed: [localhost] => (item={'image': 'docker.io/pycontribs/centos:7', 'name': 'centos7', 'pre_build_image': True})

TASK [Wait for instance(s) deletion to complete] *******************************
changed: [localhost] => (item={'started': 1, 'finished': 0, 'ansible_job_id': '824208785878.3511', 'results_file': '/root/.ansible_async/824208785878.3511', 'changed': True, 'failed': False, 'item': {'image': 'docker.io/pycontribs/centos:7', 'name': 'centos7', 'pre_build_image': True}, 'ansible_loop_var': 'item'})

PLAY RECAP *********************************************************************
localhost                  : ok=2    changed=2    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0

INFO     Pruning extra files from scenario ephemeral directory
ERROR: InvocationError for command /opt/vector-role/.tox/py37-ansible210/bin/molecule test -s podman --destroy always (exited with code 1)
py37-ansible30 installed: ansible==3.0.0,ansible-base==2.10.17,ansible-compat==1.0.0,ansible-lint==5.1.3,arrow==1.2.3,bcrypt==4.0.0,binaryornot==0.4.4,bracex==2.3.post1,cached-property==1.5.2,Cerberus==1.3.2,certifi==2022.6.15.1,cffi==1.15.1,chardet==5.0.0,charset-normalizer==2.1.1,click==8.1.3,click-help-colors==0.9.1,commonmark==0.9.1,cookiecutter==2.1.1,cryptography==38.0.1,distro==1.7.0,enrich==1.2.7,idna==3.3,importlib-metadata==4.12.0,Jinja2==3.1.2,jinja2-time==0.2.0,jmespath==1.0.1,lxml==4.9.1,MarkupSafe==2.1.1,molecule==3.4.0,molecule-podman==1.0.1,packaging==21.3,paramiko==2.11.0,pathspec==0.10.1,pluggy==0.13.1,pycparser==2.21,Pygments==2.13.0,PyNaCl==1.5.0,pyparsing==3.0.9,python-dateutil==2.8.2,python-slugify==6.1.2,PyYAML==5.4.1,requests==2.28.1,rich==12.5.1,ruamel.yaml==0.17.21,ruamel.yaml.clib==0.2.6,selinux==0.2.1,six==1.16.0,subprocess-tee==0.3.5,tenacity==8.0.1,text-unidecode==1.3,typing_extensions==4.3.0,urllib3==1.26.12,wcmatch==8.4,yamllint==1.26.3,zipp==3.8.1
py37-ansible30 run-test-pre: PYTHONHASHSEED='2945318393'
py37-ansible30 run-test: commands[0] | molecule test -s podman --destroy always
INFO     podman scenario test matrix: dependency, lint, cleanup, destroy, syntax, create, prepare, converge, idempotence, side_effect, verify, cleanup, destroy
INFO     Performing prerun...
WARNING  Failed to locate command: [Errno 2] No such file or directory: 'git': 'git'
INFO     Guessed /opt/vector-role as project root directory
INFO     Using /root/.cache/ansible-lint/b984a4/roles/artem_shtepa.vector_role symlink to current repository in order to enable Ansible to find the role using its expected full name.
INFO     Added ANSIBLE_ROLES_PATH=~/.ansible/roles:/usr/share/ansible/roles:/etc/ansible/roles:/root/.cache/ansible-lint/b984a4/roles
INFO     Running podman > dependency
WARNING  Skipping, missing the requirements file.
WARNING  Skipping, missing the requirements file.
INFO     Running podman > lint
INFO     Lint is disabled.
INFO     Running podman > cleanup
WARNING  Skipping, cleanup playbook not configured.
INFO     Running podman > destroy
INFO     Sanity checks: 'podman'

PLAY [Destroy] *****************************************************************

TASK [Destroy molecule instance(s)] ********************************************
changed: [localhost] => (item={'image': 'docker.io/pycontribs/centos:7', 'name': 'centos7', 'pre_build_image': True})

TASK [Wait for instance(s) deletion to complete] *******************************
changed: [localhost] => (item={'started': 1, 'finished': 0, 'ansible_job_id': '266779808633.3605', 'results_file': '/root/.ansible_async/266779808633.3605', 'changed': True, 'failed': False, 'item': {'image': 'docker.io/pycontribs/centos:7', 'name': 'centos7', 'pre_build_image': True}, 'ansible_loop_var': 'item'})

PLAY RECAP *********************************************************************
localhost                  : ok=2    changed=2    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0

INFO     Running podman > syntax

playbook: /opt/vector-role/molecule/resources/converge.yml
INFO     Running podman > create

PLAY [Create] ******************************************************************

TASK [get podman executable path] **********************************************
ok: [localhost]

TASK [save path to executable as fact] *****************************************
ok: [localhost]

TASK [Log into a container registry] *******************************************
skipping: [localhost] => (item="centos7 registry username: None specified")

TASK [Check presence of custom Dockerfiles] ************************************
ok: [localhost] => (item=Dockerfile: None specified)

TASK [Create Dockerfiles from image names] *************************************
skipping: [localhost] => (item="Dockerfile: None specified; Image: docker.io/pycontribs/centos:7")

TASK [Discover local Podman images] ********************************************
ok: [localhost] => (item=centos7)

TASK [Build an Ansible compatible image] ***************************************
skipping: [localhost] => (item=docker.io/pycontribs/centos:7)

TASK [Determine the CMD directives] ********************************************
ok: [localhost] => (item="centos7 command: None specified")

TASK [Remove possible pre-existing containers] *********************************
changed: [localhost]

TASK [Discover local podman networks] ******************************************
skipping: [localhost] => (item=centos7: None specified)

TASK [Create podman network dedicated to this scenario] ************************
skipping: [localhost]

TASK [Create molecule instance(s)] *********************************************
changed: [localhost] => (item=centos7)

TASK [Wait for instance(s) creation to complete] *******************************
failed: [localhost] (item=centos7) => {"ansible_job_id": "386413707022.3774", "ansible_loop_var": "item", "attempts": 1, "changed": true, "cmd": ["/usr/bin/podman", "run", "-d", "--name", "centos7", "--hostname=centos7", "docker.io/pycontribs/centos:7", "bash", "-c", "while true; do sleep 10000; done"], "delta": "0:00:00.043561", "end": "2022-09-11 11:34:55.340619", "finished": 1, "item": {"ansible_job_id": "386413707022.3774", "ansible_loop_var": "item", "changed": true, "failed": false, "finished": 0, "item": {"image": "docker.io/pycontribs/centos:7", "name": "centos7", "pre_build_image": true}, "results_file": "/root/.ansible_async/386413707022.3774", "started": 1}, "msg": "non-zero return code", "rc": 125, "start": "2022-09-11 11:34:55.297058", "stderr": "Error: invalid config provided: cannot set hostname when running in the host UTS namespace: invalid configuration", "stderr_lines": ["Error: invalid config provided: cannot set hostname when running in the host UTS namespace: invalid configuration"], "stdout": "", "stdout_lines": []}

PLAY RECAP *********************************************************************
localhost                  : ok=7    changed=2    unreachable=0    failed=1    skipped=5    rescued=0    ignored=0

CRITICAL Ansible return code was 2, command was: ['ansible-playbook', '--inventory', '/root/.cache/molecule/vector-role/podman/inventory', '--skip-tags', 'molecule-notest,notest', '/opt/vector-role/.tox/py37-ansible30/lib/python3.7/site-packages/molecule_podman/playbooks/create.yml']
WARNING  An error occurred during the test sequence action: 'create'. Cleaning up.
INFO     Running podman > cleanup
WARNING  Skipping, cleanup playbook not configured.
INFO     Running podman > destroy

PLAY [Destroy] *****************************************************************

TASK [Destroy molecule instance(s)] ********************************************
changed: [localhost] => (item={'image': 'docker.io/pycontribs/centos:7', 'name': 'centos7', 'pre_build_image': True})

TASK [Wait for instance(s) deletion to complete] *******************************
changed: [localhost] => (item={'started': 1, 'finished': 0, 'ansible_job_id': '931728167635.3832', 'results_file': '/root/.ansible_async/931728167635.3832', 'changed': True, 'failed': False, 'item': {'image': 'docker.io/pycontribs/centos:7', 'name': 'centos7', 'pre_build_image': True}, 'ansible_loop_var': 'item'})

PLAY RECAP *********************************************************************
localhost                  : ok=2    changed=2    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0

INFO     Pruning extra files from scenario ephemeral directory
ERROR: InvocationError for command /opt/vector-role/.tox/py37-ansible30/bin/molecule test -s podman --destroy always (exited with code 1)
py39-ansible210 installed: ansible==2.10.7,ansible-base==2.10.17,ansible-compat==2.2.0,ansible-lint==5.1.3,arrow==1.2.3,attrs==22.1.0,bcrypt==4.0.0,binaryornot==0.4.4,bracex==2.3.post1,Cerberus==1.3.2,certifi==2022.6.15.1,cffi==1.15.1,chardet==5.0.0,charset-normalizer==2.1.1,click==8.1.3,click-help-colors==0.9.1,commonmark==0.9.1,cookiecutter==2.1.1,cryptography==38.0.1,distro==1.7.0,enrich==1.2.7,idna==3.3,Jinja2==3.1.2,jinja2-time==0.2.0,jmespath==1.0.1,jsonschema==4.16.0,lxml==4.9.1,MarkupSafe==2.1.1,molecule==3.4.0,molecule-podman==1.0.1,packaging==21.3,paramiko==2.11.0,pathspec==0.10.1,pluggy==0.13.1,pycparser==2.21,Pygments==2.13.0,PyNaCl==1.5.0,pyparsing==3.0.9,pyrsistent==0.18.1,python-dateutil==2.8.2,python-slugify==6.1.2,PyYAML==5.4.1,requests==2.28.1,rich==12.5.1,ruamel.yaml==0.17.21,ruamel.yaml.clib==0.2.6,selinux==0.2.1,six==1.16.0,subprocess-tee==0.3.5,tenacity==8.0.1,text-unidecode==1.3,urllib3==1.26.12,wcmatch==8.4,yamllint==1.26.3
py39-ansible210 run-test-pre: PYTHONHASHSEED='2945318393'
py39-ansible210 run-test: commands[0] | molecule test -s podman --destroy always
INFO     podman scenario test matrix: dependency, lint, cleanup, destroy, syntax, create, prepare, converge, idempotence, side_effect, verify, cleanup, destroy
INFO     Performing prerun...
WARNING  Failed to locate command: [Errno 2] No such file or directory: 'git'
INFO     Guessed /opt/vector-role as project root directory
INFO     Using /root/.cache/ansible-lint/b984a4/roles/artem_shtepa.vector_role symlink to current repository in order to enable Ansible to find the role using its expected full name.
INFO     Added ANSIBLE_ROLES_PATH=~/.ansible/roles:/usr/share/ansible/roles:/etc/ansible/roles:/root/.cache/ansible-lint/b984a4/roles
INFO     Running podman > dependency
WARNING  Skipping, missing the requirements file.
WARNING  Skipping, missing the requirements file.
INFO     Running podman > lint
INFO     Lint is disabled.
INFO     Running podman > cleanup
WARNING  Skipping, cleanup playbook not configured.
INFO     Running podman > destroy
INFO     Sanity checks: 'podman'

PLAY [Destroy] *****************************************************************

TASK [Destroy molecule instance(s)] ********************************************
changed: [localhost] => (item={'image': 'docker.io/pycontribs/centos:7', 'name': 'centos7', 'pre_build_image': True})

TASK [Wait for instance(s) deletion to complete] *******************************
changed: [localhost] => (item={'started': 1, 'finished': 0, 'ansible_job_id': '99216622436.3900', 'results_file': '/root/.ansible_async/99216622436.3900', 'changed': True, 'failed': False, 'item': {'image': 'docker.io/pycontribs/centos:7', 'name': 'centos7', 'pre_build_image': True}, 'ansible_loop_var': 'item'})

PLAY RECAP *********************************************************************
localhost                  : ok=2    changed=2    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0

INFO     Running podman > syntax

playbook: /opt/vector-role/molecule/resources/converge.yml
INFO     Running podman > create

PLAY [Create] ******************************************************************

TASK [get podman executable path] **********************************************
ok: [localhost]

TASK [save path to executable as fact] *****************************************
ok: [localhost]

TASK [Log into a container registry] *******************************************
skipping: [localhost] => (item="centos7 registry username: None specified")

TASK [Check presence of custom Dockerfiles] ************************************
ok: [localhost] => (item=Dockerfile: None specified)

TASK [Create Dockerfiles from image names] *************************************
skipping: [localhost] => (item="Dockerfile: None specified; Image: docker.io/pycontribs/centos:7")

TASK [Discover local Podman images] ********************************************
ok: [localhost] => (item=centos7)

TASK [Build an Ansible compatible image] ***************************************
skipping: [localhost] => (item=docker.io/pycontribs/centos:7)

TASK [Determine the CMD directives] ********************************************
ok: [localhost] => (item="centos7 command: None specified")

TASK [Remove possible pre-existing containers] *********************************
changed: [localhost]

TASK [Discover local podman networks] ******************************************
skipping: [localhost] => (item=centos7: None specified)

TASK [Create podman network dedicated to this scenario] ************************
skipping: [localhost]

TASK [Create molecule instance(s)] *********************************************
changed: [localhost] => (item=centos7)

TASK [Wait for instance(s) creation to complete] *******************************
failed: [localhost] (item=centos7) => {"ansible_job_id": "453345608163.4051", "ansible_loop_var": "item", "attempts": 1, "changed": true, "cmd": ["/usr/bin/podman", "run", "-d", "--name", "centos7", "--hostname=centos7", "docker.io/pycontribs/centos:7", "bash", "-c", "while true; do sleep 10000; done"], "delta": "0:00:00.044988", "end": "2022-09-11 11:35:08.693879", "finished": 1, "item": {"ansible_job_id": "453345608163.4051", "ansible_loop_var": "item", "changed": true, "failed": false, "finished": 0, "item": {"image": "docker.io/pycontribs/centos:7", "name": "centos7", "pre_build_image": true}, "results_file": "/root/.ansible_async/453345608163.4051", "started": 1}, "msg": "non-zero return code", "rc": 125, "start": "2022-09-11 11:35:08.648891", "stderr": "Error: invalid config provided: cannot set hostname when running in the host UTS namespace: invalid configuration", "stderr_lines": ["Error: invalid config provided: cannot set hostname when running in the host UTS namespace: invalid configuration"], "stdout": "", "stdout_lines": []}

PLAY RECAP *********************************************************************
localhost                  : ok=7    changed=2    unreachable=0    failed=1    skipped=5    rescued=0    ignored=0

CRITICAL Ansible return code was 2, command was: ['ansible-playbook', '--inventory', '/root/.cache/molecule/vector-role/podman/inventory', '--skip-tags', 'molecule-notest,notest', '/opt/vector-role/.tox/py39-ansible210/lib/python3.9/site-packages/molecule_podman/playbooks/create.yml']
WARNING  An error occurred during the test sequence action: 'create'. Cleaning up.
INFO     Running podman > cleanup
WARNING  Skipping, cleanup playbook not configured.
INFO     Running podman > destroy

PLAY [Destroy] *****************************************************************

TASK [Destroy molecule instance(s)] ********************************************
changed: [localhost] => (item={'image': 'docker.io/pycontribs/centos:7', 'name': 'centos7', 'pre_build_image': True})

TASK [Wait for instance(s) deletion to complete] *******************************
changed: [localhost] => (item={'started': 1, 'finished': 0, 'ansible_job_id': '173151728599.4100', 'results_file': '/root/.ansible_async/173151728599.4100', 'changed': True, 'failed': False, 'item': {'image': 'docker.io/pycontribs/centos:7', 'name': 'centos7', 'pre_build_image': True}, 'ansible_loop_var': 'item'})

PLAY RECAP *********************************************************************
localhost                  : ok=2    changed=2    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0

INFO     Pruning extra files from scenario ephemeral directory
ERROR: InvocationError for command /opt/vector-role/.tox/py39-ansible210/bin/molecule test -s podman --destroy always (exited with code 1)
py39-ansible30 installed: ansible==3.0.0,ansible-base==2.10.17,ansible-compat==2.2.0,ansible-lint==5.1.3,arrow==1.2.3,attrs==22.1.0,bcrypt==4.0.0,binaryornot==0.4.4,bracex==2.3.post1,Cerberus==1.3.2,certifi==2022.6.15.1,cffi==1.15.1,chardet==5.0.0,charset-normalizer==2.1.1,click==8.1.3,click-help-colors==0.9.1,commonmark==0.9.1,cookiecutter==2.1.1,cryptography==38.0.1,distro==1.7.0,enrich==1.2.7,idna==3.3,Jinja2==3.1.2,jinja2-time==0.2.0,jmespath==1.0.1,jsonschema==4.16.0,lxml==4.9.1,MarkupSafe==2.1.1,molecule==3.4.0,molecule-podman==1.0.1,packaging==21.3,paramiko==2.11.0,pathspec==0.10.1,pluggy==0.13.1,pycparser==2.21,Pygments==2.13.0,PyNaCl==1.5.0,pyparsing==3.0.9,pyrsistent==0.18.1,python-dateutil==2.8.2,python-slugify==6.1.2,PyYAML==5.4.1,requests==2.28.1,rich==12.5.1,ruamel.yaml==0.17.21,ruamel.yaml.clib==0.2.6,selinux==0.2.1,six==1.16.0,subprocess-tee==0.3.5,tenacity==8.0.1,text-unidecode==1.3,urllib3==1.26.12,wcmatch==8.4,yamllint==1.26.3
py39-ansible30 run-test-pre: PYTHONHASHSEED='2945318393'
py39-ansible30 run-test: commands[0] | molecule test -s podman --destroy always
INFO     podman scenario test matrix: dependency, lint, cleanup, destroy, syntax, create, prepare, converge, idempotence, side_effect, verify, cleanup, destroy
INFO     Performing prerun...
WARNING  Failed to locate command: [Errno 2] No such file or directory: 'git'
INFO     Guessed /opt/vector-role as project root directory
INFO     Using /root/.cache/ansible-lint/b984a4/roles/artem_shtepa.vector_role symlink to current repository in order to enable Ansible to find the role using its expected full name.
INFO     Added ANSIBLE_ROLES_PATH=~/.ansible/roles:/usr/share/ansible/roles:/etc/ansible/roles:/root/.cache/ansible-lint/b984a4/roles
INFO     Running podman > dependency
WARNING  Skipping, missing the requirements file.
WARNING  Skipping, missing the requirements file.
INFO     Running podman > lint
INFO     Lint is disabled.
INFO     Running podman > cleanup
WARNING  Skipping, cleanup playbook not configured.
INFO     Running podman > destroy
INFO     Sanity checks: 'podman'

PLAY [Destroy] *****************************************************************

TASK [Destroy molecule instance(s)] ********************************************
changed: [localhost] => (item={'image': 'docker.io/pycontribs/centos:7', 'name': 'centos7', 'pre_build_image': True})

TASK [Wait for instance(s) deletion to complete] *******************************
changed: [localhost] => (item={'started': 1, 'finished': 0, 'ansible_job_id': '331091900457.4161', 'results_file': '/root/.ansible_async/331091900457.4161', 'changed': True, 'failed': False, 'item': {'image': 'docker.io/pycontribs/centos:7', 'name': 'centos7', 'pre_build_image': True}, 'ansible_loop_var': 'item'})

PLAY RECAP *********************************************************************
localhost                  : ok=2    changed=2    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0

INFO     Running podman > syntax

playbook: /opt/vector-role/molecule/resources/converge.yml
INFO     Running podman > create

PLAY [Create] ******************************************************************

TASK [get podman executable path] **********************************************
ok: [localhost]

TASK [save path to executable as fact] *****************************************
ok: [localhost]

TASK [Log into a container registry] *******************************************
skipping: [localhost] => (item="centos7 registry username: None specified")

TASK [Check presence of custom Dockerfiles] ************************************
ok: [localhost] => (item=Dockerfile: None specified)

TASK [Create Dockerfiles from image names] *************************************
skipping: [localhost] => (item="Dockerfile: None specified; Image: docker.io/pycontribs/centos:7")

TASK [Discover local Podman images] ********************************************
ok: [localhost] => (item=centos7)

TASK [Build an Ansible compatible image] ***************************************
skipping: [localhost] => (item=docker.io/pycontribs/centos:7)

TASK [Determine the CMD directives] ********************************************
ok: [localhost] => (item="centos7 command: None specified")

TASK [Remove possible pre-existing containers] *********************************
changed: [localhost]

TASK [Discover local podman networks] ******************************************
skipping: [localhost] => (item=centos7: None specified)

TASK [Create podman network dedicated to this scenario] ************************
skipping: [localhost]

TASK [Create molecule instance(s)] *********************************************
changed: [localhost] => (item=centos7)

TASK [Wait for instance(s) creation to complete] *******************************
failed: [localhost] (item=centos7) => {"ansible_job_id": "655377812848.4313", "ansible_loop_var": "item", "attempts": 1, "changed": true, "cmd": ["/usr/bin/podman", "run", "-d", "--name", "centos7", "--hostname=centos7", "docker.io/pycontribs/centos:7", "bash", "-c", "while true; do sleep 10000; done"], "delta": "0:00:00.062807", "end": "2022-09-11 11:35:22.013978", "finished": 1, "item": {"ansible_job_id": "655377812848.4313", "ansible_loop_var": "item", "changed": true, "failed": false, "finished": 0, "item": {"image": "docker.io/pycontribs/centos:7", "name": "centos7", "pre_build_image": true}, "results_file": "/root/.ansible_async/655377812848.4313", "started": 1}, "msg": "non-zero return code", "rc": 125, "start": "2022-09-11 11:35:21.951171", "stderr": "Error: invalid config provided: cannot set hostname when running in the host UTS namespace: invalid configuration", "stderr_lines": ["Error: invalid config provided: cannot set hostname when running in the host UTS namespace: invalid configuration"], "stdout": "", "stdout_lines": []}

PLAY RECAP *********************************************************************
localhost                  : ok=7    changed=2    unreachable=0    failed=1    skipped=5    rescued=0    ignored=0

CRITICAL Ansible return code was 2, command was: ['ansible-playbook', '--inventory', '/root/.cache/molecule/vector-role/podman/inventory', '--skip-tags', 'molecule-notest,notest', '/opt/vector-role/.tox/py39-ansible30/lib/python3.9/site-packages/molecule_podman/playbooks/create.yml']
WARNING  An error occurred during the test sequence action: 'create'. Cleaning up.
INFO     Running podman > cleanup
WARNING  Skipping, cleanup playbook not configured.
INFO     Running podman > destroy

PLAY [Destroy] *****************************************************************

TASK [Destroy molecule instance(s)] ********************************************
changed: [localhost] => (item={'image': 'docker.io/pycontribs/centos:7', 'name': 'centos7', 'pre_build_image': True})

TASK [Wait for instance(s) deletion to complete] *******************************
changed: [localhost] => (item={'started': 1, 'finished': 0, 'ansible_job_id': '954966452117.4363', 'results_file': '/root/.ansible_async/954966452117.4363', 'changed': True, 'failed': False, 'item': {'image': 'docker.io/pycontribs/centos:7', 'name': 'centos7', 'pre_build_image': True}, 'ansible_loop_var': 'item'})

PLAY RECAP *********************************************************************
localhost                  : ok=2    changed=2    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0

INFO     Pruning extra files from scenario ephemeral directory
ERROR: InvocationError for command /opt/vector-role/.tox/py39-ansible30/bin/molecule test -s podman --destroy always (exited with code 1)
_______________________________________________________ summary ________________________________________________________
ERROR:   py37-ansible210: commands failed
ERROR:   py37-ansible30: commands failed
ERROR:   py39-ansible210: commands failed
ERROR:   py39-ansible30: commands failed
[root@a906a0f6163d vector-role]#
```

Провалв прогоне роли **Tox** по причине - при выполнении драйвером **molecule_podman** команды `/usr/bin/podman run -d --name centos7 --hostname=centos7 docker.io/pycontribs/centos:7 bash -c "while true; do sleep 10000; done"`
**podman** не удалось создать контейнер ( `Error: invalid config provided: cannot set hostname when running in the host UTS namespace: invalid configuration`), так как неверно задана конфигурация контейнера (нельзя указывать `--hostname`).

> :exclamation: Решение данной проблемы я не вижу, ибо при модификации кода модуля **molecule_podman** с целью удаления этого параметра в данном случе не достаточно - возникают другие ошибки. НО! Если модифицировать `tox.ini` следующим образом:

```ini
[tox]
minversion = 1.8
basepython = python3.6
envlist = py{37,39}-ansible{210,30}
skipsdist = true
[testenv]
passenv = *
deps =
    -r tox-requirements.txt
    ansible210: ansible<3.0
    ansible30: ansible<3.1
commands =
    {posargs:ansible --version}
    {posargs:python3 --version}
    {posargs:python3 test.py}
```

а файл `test.py` наполнить следующим содержимым:

```python
#!/usr/bin/env python3
print("OK\n")
```

то успешное выполнение **Tox** будет выглядеть следующим образом:

```console
[root@cd1242c242a5 vector-role]# tox
py37-ansible210 installed: ansible==2.10.7,ansible-base==2.10.17,ansible-compat==1.0.0,ansible-lint==5.1.3,arrow==1.2.3,bcrypt==4.0.0,binaryornot==0.4.4,bracex==2.3.post1,cached-property==1.5.2,Cerberus==1.3.2,certifi==2022.6.15.1,cffi==1.15.1,chardet==5.0.0,charset-normalizer==2.1.1,click==8.1.3,click-help-colors==0.9.1,commonmark==0.9.1,cookiecutter==2.1.1,cryptography==38.0.1,distro==1.7.0,enrich==1.2.7,idna==3.3,importlib-metadata==4.12.0,Jinja2==3.1.2,jinja2-time==0.2.0,jmespath==1.0.1,lxml==4.9.1,MarkupSafe==2.1.1,molecule==3.4.0,molecule-podman==1.0.1,packaging==21.3,paramiko==2.11.0,pathspec==0.10.1,pluggy==0.13.1,pycparser==2.21,Pygments==2.13.0,PyNaCl==1.5.0,pyparsing==3.0.9,python-dateutil==2.8.2,python-slugify==6.1.2,PyYAML==5.4.1,requests==2.28.1,rich==12.5.1,ruamel.yaml==0.17.21,ruamel.yaml.clib==0.2.6,selinux==0.2.1,six==1.16.0,subprocess-tee==0.3.5,tenacity==8.0.1,text-unidecode==1.3,typing_extensions==4.3.0,urllib3==1.26.12,wcmatch==8.4,yamllint==1.26.3,zipp==3.8.1
py37-ansible210 run-test-pre: PYTHONHASHSEED='1020171791'
py37-ansible210 run-test: commands[0] | ansible --version
ansible 2.10.17
  config file = None
  configured module search path = ['/root/.ansible/plugins/modules', '/usr/share/ansible/plugins/modules']
  ansible python module location = /opt/vector-role/.tox/py37-ansible210/lib/python3.7/site-packages/ansible
  executable location = /opt/vector-role/.tox/py37-ansible210/bin/ansible
  python version = 3.7.10 (default, Jun 13 2022, 19:37:24) [GCC 8.5.0 20210514 (Red Hat 8.5.0-10)]
py37-ansible210 run-test: commands[1] | python3 --version
Python 3.7.10
py37-ansible210 run-test: commands[2] | python3 test.py
OK

py37-ansible30 installed: ansible==3.0.0,ansible-base==2.10.17,ansible-compat==1.0.0,ansible-lint==5.1.3,arrow==1.2.3,bcrypt==4.0.0,binaryornot==0.4.4,bracex==2.3.post1,cached-property==1.5.2,Cerberus==1.3.2,certifi==2022.6.15.1,cffi==1.15.1,chardet==5.0.0,charset-normalizer==2.1.1,click==8.1.3,click-help-colors==0.9.1,commonmark==0.9.1,cookiecutter==2.1.1,cryptography==38.0.1,distro==1.7.0,enrich==1.2.7,idna==3.3,importlib-metadata==4.12.0,Jinja2==3.1.2,jinja2-time==0.2.0,jmespath==1.0.1,lxml==4.9.1,MarkupSafe==2.1.1,molecule==3.4.0,molecule-podman==1.0.1,packaging==21.3,paramiko==2.11.0,pathspec==0.10.1,pluggy==0.13.1,pycparser==2.21,Pygments==2.13.0,PyNaCl==1.5.0,pyparsing==3.0.9,python-dateutil==2.8.2,python-slugify==6.1.2,PyYAML==5.4.1,requests==2.28.1,rich==12.5.1,ruamel.yaml==0.17.21,ruamel.yaml.clib==0.2.6,selinux==0.2.1,six==1.16.0,subprocess-tee==0.3.5,tenacity==8.0.1,text-unidecode==1.3,typing_extensions==4.3.0,urllib3==1.26.12,wcmatch==8.4,yamllint==1.26.3,zipp==3.8.1
py37-ansible30 run-test-pre: PYTHONHASHSEED='1020171791'
py37-ansible30 run-test: commands[0] | ansible --version
ansible 2.10.17
  config file = None
  configured module search path = ['/root/.ansible/plugins/modules', '/usr/share/ansible/plugins/modules']
  ansible python module location = /opt/vector-role/.tox/py37-ansible30/lib/python3.7/site-packages/ansible
  executable location = /opt/vector-role/.tox/py37-ansible30/bin/ansible
  python version = 3.7.10 (default, Jun 13 2022, 19:37:24) [GCC 8.5.0 20210514 (Red Hat 8.5.0-10)]
py37-ansible30 run-test: commands[1] | python3 --version
Python 3.7.10
py37-ansible30 run-test: commands[2] | python3 test.py
OK

py39-ansible210 installed: ansible==2.10.7,ansible-base==2.10.17,ansible-compat==2.2.0,ansible-lint==5.1.3,arrow==1.2.3,attrs==22.1.0,bcrypt==4.0.0,binaryornot==0.4.4,bracex==2.3.post1,Cerberus==1.3.2,certifi==2022.6.15.1,cffi==1.15.1,chardet==5.0.0,charset-normalizer==2.1.1,click==8.1.3,click-help-colors==0.9.1,commonmark==0.9.1,cookiecutter==2.1.1,cryptography==38.0.1,distro==1.7.0,enrich==1.2.7,idna==3.3,Jinja2==3.1.2,jinja2-time==0.2.0,jmespath==1.0.1,jsonschema==4.16.0,lxml==4.9.1,MarkupSafe==2.1.1,molecule==3.4.0,molecule-podman==1.0.1,packaging==21.3,paramiko==2.11.0,pathspec==0.10.1,pluggy==0.13.1,pycparser==2.21,Pygments==2.13.0,PyNaCl==1.5.0,pyparsing==3.0.9,pyrsistent==0.18.1,python-dateutil==2.8.2,python-slugify==6.1.2,PyYAML==5.4.1,requests==2.28.1,rich==12.5.1,ruamel.yaml==0.17.21,ruamel.yaml.clib==0.2.6,selinux==0.2.1,six==1.16.0,subprocess-tee==0.3.5,tenacity==8.0.1,text-unidecode==1.3,urllib3==1.26.12,wcmatch==8.4,yamllint==1.26.3
py39-ansible210 run-test-pre: PYTHONHASHSEED='1020171791'
py39-ansible210 run-test: commands[0] | ansible --version
ansible 2.10.17
  config file = None
  configured module search path = ['/root/.ansible/plugins/modules', '/usr/share/ansible/plugins/modules']
  ansible python module location = /opt/vector-role/.tox/py39-ansible210/lib/python3.9/site-packages/ansible
  executable location = /opt/vector-role/.tox/py39-ansible210/bin/ansible
  python version = 3.9.2 (default, Jun 13 2022, 19:42:33) [GCC 8.5.0 20210514 (Red Hat 8.5.0-10)]
py39-ansible210 run-test: commands[1] | python3 --version
Python 3.9.2
py39-ansible210 run-test: commands[2] | python3 test.py
OK

py39-ansible30 installed: ansible==3.0.0,ansible-base==2.10.17,ansible-compat==2.2.0,ansible-lint==5.1.3,arrow==1.2.3,attrs==22.1.0,bcrypt==4.0.0,binaryornot==0.4.4,bracex==2.3.post1,Cerberus==1.3.2,certifi==2022.6.15.1,cffi==1.15.1,chardet==5.0.0,charset-normalizer==2.1.1,click==8.1.3,click-help-colors==0.9.1,commonmark==0.9.1,cookiecutter==2.1.1,cryptography==38.0.1,distro==1.7.0,enrich==1.2.7,idna==3.3,Jinja2==3.1.2,jinja2-time==0.2.0,jmespath==1.0.1,jsonschema==4.16.0,lxml==4.9.1,MarkupSafe==2.1.1,molecule==3.4.0,molecule-podman==1.0.1,packaging==21.3,paramiko==2.11.0,pathspec==0.10.1,pluggy==0.13.1,pycparser==2.21,Pygments==2.13.0,PyNaCl==1.5.0,pyparsing==3.0.9,pyrsistent==0.18.1,python-dateutil==2.8.2,python-slugify==6.1.2,PyYAML==5.4.1,requests==2.28.1,rich==12.5.1,ruamel.yaml==0.17.21,ruamel.yaml.clib==0.2.6,selinux==0.2.1,six==1.16.0,subprocess-tee==0.3.5,tenacity==8.0.1,text-unidecode==1.3,urllib3==1.26.12,wcmatch==8.4,yamllint==1.26.3
py39-ansible30 run-test-pre: PYTHONHASHSEED='1020171791'
py39-ansible30 run-test: commands[0] | ansible --version
ansible 2.10.17
  config file = None
  configured module search path = ['/root/.ansible/plugins/modules', '/usr/share/ansible/plugins/modules']
  ansible python module location = /opt/vector-role/.tox/py39-ansible30/lib/python3.9/site-packages/ansible
  executable location = /opt/vector-role/.tox/py39-ansible30/bin/ansible
  python version = 3.9.2 (default, Jun 13 2022, 19:42:33) [GCC 8.5.0 20210514 (Red Hat 8.5.0-10)]
py39-ansible30 run-test: commands[1] | python3 --version
Python 3.9.2
py39-ansible30 run-test: commands[2] | python3 test.py
OK

_______________________________________________________ summary ________________________________________________________
  py37-ansible210: commands succeeded
  py37-ansible30: commands succeeded
  py39-ansible210: commands succeeded
  py39-ansible30: commands succeeded
  congratulations :)
[root@cd1242c242a5 vector-role]#
```
---


## Необязательная часть

1. Проделайте схожие манипуляции для создания роли lighthouse.
2. Создайте сценарий внутри любой из своих ролей, который умеет поднимать весь стек при помощи всех ролей.
3. Убедитесь в работоспособности своего стека. Создайте отдельный verify.yml, который будет проверять работоспособность интеграции всех инструментов между ними.
4. Выложите свои roles в репозитории.

В качестве решения пришлите ссылки и скриншоты этапов выполнения задания.

Позже,может,быть
---

### Как оформить ДЗ?

Выполненное домашнее задание пришлите ссылкой на .md-файл в вашем репозитории.
