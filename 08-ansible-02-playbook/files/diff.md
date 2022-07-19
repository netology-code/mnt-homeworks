```dpopov@dpopov-test:~/mnt-hwk/playbook$ sudo ansible-playbook -i inventory/prod.yml site.yml --diff

PLAY [all] ***************************************************************************************************************************************************************

TASK [Check for Python] **************************************************************************************************************************************************
ok: [clickhouse-01]

TASK [Install Python] ****************************************************************************************************************************************************
skipping: [clickhouse-01]

PLAY [Installing missing packages on managed] ****************************************************************************************************************************

TASK [Gathering Facts] ***************************************************************************************************************************************************
ok: [clickhouse-01]

TASK [Installing missing sudo, procps] ***********************************************************************************************************************************
ok: [clickhouse-01]

PLAY [Install Clickhouse] ************************************************************************************************************************************************

TASK [Gathering Facts] ***************************************************************************************************************************************************
ok: [clickhouse-01]

TASK [Install clickhouse-common] *****************************************************************************************************************************************
ok: [clickhouse-01]

TASK [Install clickhouse-client] *****************************************************************************************************************************************
ok: [clickhouse-01]

TASK [Install clickhouse-server] *****************************************************************************************************************************************
ok: [clickhouse-01]

TASK [Create database] ***************************************************************************************************************************************************
ok: [clickhouse-01]

PLAY [Install vector] ****************************************************************************************************************************************************

TASK [Gathering Facts] ***************************************************************************************************************************************************
ok: [clickhouse-01]

TASK [creating files directory] ******************************************************************************************************************************************
ok: [clickhouse-01]

TASK [downloading vector] ************************************************************************************************************************************************
ok: [clickhouse-01]

TASK [unarchiving vector] ************************************************************************************************************************************************
ok: [clickhouse-01]

PLAY RECAP ***************************************************************************************************************************************************************
clickhouse-01              : ok=12   changed=0    unreachable=0    failed=0    skipped=1    rescued=0    ignored=0

dpopov@dpopov-test:~/mnt-hwk/playbook$ sudo docker stop deb11
deb11
dpopov@dpopov-test:~/mnt-hwk/playbook$ sudo docker run -d --rm --name deb11 debian:11 sleep 5000000
a5dc8ed711b266970a064c5870a15e3aeac49b8f1ba7695fc375e12c26637e00
dpopov@dpopov-test:~/mnt-hwk/playbook$ sudo ansible-playbook -i inventory/prod.yml site.yml --diff

PLAY [all] ***************************************************************************************************************************************************************

TASK [Check for Python] **************************************************************************************************************************************************
ok: [clickhouse-01]

TASK [Install Python] ****************************************************************************************************************************************************
changed: [clickhouse-01]

PLAY [Installing missing packages on managed] ****************************************************************************************************************************

TASK [Gathering Facts] ***************************************************************************************************************************************************
ok: [clickhouse-01]

TASK [Installing missing sudo, procps] ***********************************************************************************************************************************
The following additional packages will be installed:
  libncurses6 libprocps8 psmisc
The following NEW packages will be installed:
  libncurses6 libprocps8 procps psmisc sudo
0 upgraded, 5 newly installed, 0 to remove and 0 not upgraded.
changed: [clickhouse-01]

PLAY [Install Clickhouse] ************************************************************************************************************************************************

TASK [Gathering Facts] ***************************************************************************************************************************************************
ok: [clickhouse-01]

TASK [Install clickhouse-common] *****************************************************************************************************************************************
Selecting previously unselected package clickhouse-common-static.
(Reading database ... 9478 files and directories currently installed.)
Preparing to unpack .../clickhouse-common-static_22.3.3.44_amd64xvnn9464.deb ...
Unpacking clickhouse-common-static (22.3.3.44) ...
Setting up clickhouse-common-static (22.3.3.44) ...
changed: [clickhouse-01]

TASK [Install clickhouse-client] *****************************************************************************************************************************************
Selecting previously unselected package clickhouse-client.
(Reading database ... 9492 files and directories currently installed.)
Preparing to unpack .../clickhouse-client_22.3.3.44_allk1v1ajo2.deb ...
Unpacking clickhouse-client (22.3.3.44) ...
Setting up clickhouse-client (22.3.3.44) ...
changed: [clickhouse-01]

TASK [Install clickhouse-server] *****************************************************************************************************************************************
Selecting previously unselected package clickhouse-server.
(Reading database ... 9505 files and directories currently installed.)
Preparing to unpack .../clickhouse-server_22.3.3.44_allp_bx3cu7.deb ...
Unpacking clickhouse-server (22.3.3.44) ...
Setting up clickhouse-server (22.3.3.44) ...
changed: [clickhouse-01]

TASK [Create database] ***************************************************************************************************************************************************
fatal: [clickhouse-01]: FAILED! => {"changed": false, "cmd": ["clickhouse-client", "-q", "create database logs;"], "delta": "0:00:00.058550", "end": "2022-07-17 17:28:13.348343", "failed_when_result": true, "msg": "non-zero return code", "rc": 210, "start": "2022-07-17 17:28:13.289793", "stderr": "Code: 210. DB::NetException: Connection refused (localhost:9000). (NETWORK_ERROR)", "stderr_lines": ["Code: 210. DB::NetException: Connection refused (localhost:9000). (NETWORK_ERROR)"], "stdout": "", "stdout_lines": []}

RUNNING HANDLER [Starting clickhouse server] *****************************************************************************************************************************

PLAY RECAP ***************************************************************************************************************************************************************
clickhouse-01              : ok=8    changed=5    unreachable=0    failed=1    skipped=0    rescued=0    ignored=0

dpopov@dpopov-test:~/mnt-hwk/playbook$ nano site.yml
dpopov@dpopov-test:~/mnt-hwk/playbook$ sudo ansible-playbook -i inventory/prod.yml site.yml --diff

PLAY [all] ***************************************************************************************************************************************************************

TASK [Check for Python] **************************************************************************************************************************************************
ok: [clickhouse-01]

TASK [Install Python] ****************************************************************************************************************************************************
skipping: [clickhouse-01]

PLAY [Installing missing packages on managed] ****************************************************************************************************************************

TASK [Gathering Facts] ***************************************************************************************************************************************************
ok: [clickhouse-01]

TASK [Installing missing sudo, procps] ***********************************************************************************************************************************
ok: [clickhouse-01]

PLAY [Install Clickhouse] ************************************************************************************************************************************************

TASK [Gathering Facts] ***************************************************************************************************************************************************
ok: [clickhouse-01]

TASK [Install clickhouse-common] *****************************************************************************************************************************************
ok: [clickhouse-01]

TASK [Install clickhouse-client] *****************************************************************************************************************************************
ok: [clickhouse-01]

TASK [Install clickhouse-server] *****************************************************************************************************************************************
ok: [clickhouse-01]

TASK [Create database] ***************************************************************************************************************************************************
fatal: [clickhouse-01]: FAILED! => {"changed": false, "cmd": ["clickhouse-client", "-q", "create database logs;"], "delta": "0:00:00.053068", "end": "2022-07-17 17:29:50.844569", "failed_when_result": true, "msg": "non-zero return code", "rc": 210, "start": "2022-07-17 17:29:50.791501", "stderr": "Code: 210. DB::NetException: Connection refused (localhost:9000). (NETWORK_ERROR)", "stderr_lines": ["Code: 210. DB::NetException: Connection refused (localhost:9000). (NETWORK_ERROR)"], "stdout": "", "stdout_lines": []}

PLAY RECAP ***************************************************************************************************************************************************************
clickhouse-01              : ok=7    changed=0    unreachable=0    failed=1    skipped=1    rescued=0    ignored=0

dpopov@dpopov-test:~/mnt-hwk/playbook$ nano site.yml
dpopov@dpopov-test:~/mnt-hwk/playbook$ sudo ansible-playbook -i inventory/prod.yml site.yml --diff

PLAY [all] ***************************************************************************************************************************************************************

TASK [Check for Python] **************************************************************************************************************************************************
ok: [clickhouse-01]

TASK [Install Python] ****************************************************************************************************************************************************
skipping: [clickhouse-01]

PLAY [Installing missing packages on managed] ****************************************************************************************************************************

TASK [Gathering Facts] ***************************************************************************************************************************************************
ok: [clickhouse-01]

TASK [Installing missing sudo, procps] ***********************************************************************************************************************************
ok: [clickhouse-01]

PLAY [Install Clickhouse] ************************************************************************************************************************************************

TASK [Gathering Facts] ***************************************************************************************************************************************************
ok: [clickhouse-01]

TASK [Install clickhouse-common] *****************************************************************************************************************************************
ok: [clickhouse-01]

TASK [Install clickhouse-client] *****************************************************************************************************************************************
ok: [clickhouse-01]

TASK [Install clickhouse-server] *****************************************************************************************************************************************
ok: [clickhouse-01]

TASK [Starting clickhouse server] ****************************************************************************************************************************************
changed: [clickhouse-01]

TASK [Create database] ***************************************************************************************************************************************************
changed: [clickhouse-01]

PLAY [Install vector] ****************************************************************************************************************************************************

TASK [Gathering Facts] ***************************************************************************************************************************************************
ok: [clickhouse-01]

TASK [creating files directory] ******************************************************************************************************************************************
--- before
+++ after
@@ -1,4 +1,4 @@
 {
     "path": "./files",
-    "state": "absent"
+    "state": "directory"
 }

changed: [clickhouse-01]

TASK [downloading vector] ************************************************************************************************************************************************
changed: [clickhouse-01]

TASK [unarchiving vector] ************************************************************************************************************************************************
changed: [clickhouse-01]

PLAY RECAP ***************************************************************************************************************************************************************
clickhouse-01              : ok=13   changed=5    unreachable=0    failed=0    skipped=1    rescued=0    ignored=0

dpopov@dpopov-test:~/mnt-hwk/playbook$ sudo docker stop deb11
deb11
dpopov@dpopov-test:~/mnt-hwk/playbook$ sudo docker run -d --rm --name deb11 debian:11 sleep 5000000
aa4668c4e3396f4cad6b8c971d6fe4c210720f2ca2cc8ae9f4d795b5126881b3
dpopov@dpopov-test:~/mnt-hwk/playbook$ sudo ansible-playbook -i inventory/prod.yml site.yml --diff

PLAY [all] ***************************************************************************************************************************************************************

TASK [Check for Python] **************************************************************************************************************************************************
ok: [clickhouse-01]

TASK [Install Python] ****************************************************************************************************************************************************
changed: [clickhouse-01]

PLAY [Installing missing packages on managed] ****************************************************************************************************************************

TASK [Gathering Facts] ***************************************************************************************************************************************************
ok: [clickhouse-01]

TASK [Installing missing sudo, procps] ***********************************************************************************************************************************
The following additional packages will be installed:
  libncurses6 libprocps8 psmisc
The following NEW packages will be installed:
  libncurses6 libprocps8 procps psmisc sudo
0 upgraded, 5 newly installed, 0 to remove and 0 not upgraded.
changed: [clickhouse-01]

PLAY [Install Clickhouse] ************************************************************************************************************************************************

TASK [Gathering Facts] ***************************************************************************************************************************************************
ok: [clickhouse-01]

TASK [Install clickhouse-common] *****************************************************************************************************************************************
Selecting previously unselected package clickhouse-common-static.
(Reading database ... 9478 files and directories currently installed.)
Preparing to unpack .../clickhouse-common-static_22.3.3.44_amd6409hp00dg.deb ...
Unpacking clickhouse-common-static (22.3.3.44) ...
Setting up clickhouse-common-static (22.3.3.44) ...
changed: [clickhouse-01]

TASK [Install clickhouse-client] *****************************************************************************************************************************************
Selecting previously unselected package clickhouse-client.
(Reading database ... 9492 files and directories currently installed.)
Preparing to unpack .../clickhouse-client_22.3.3.44_all6begf_m1.deb ...
Unpacking clickhouse-client (22.3.3.44) ...
Setting up clickhouse-client (22.3.3.44) ...
changed: [clickhouse-01]

TASK [Install clickhouse-server] *****************************************************************************************************************************************
Selecting previously unselected package clickhouse-server.
(Reading database ... 9505 files and directories currently installed.)
Preparing to unpack .../clickhouse-server_22.3.3.44_alla0kt8vk1.deb ...
Unpacking clickhouse-server (22.3.3.44) ...
Setting up clickhouse-server (22.3.3.44) ...
changed: [clickhouse-01]

TASK [Starting clickhouse server] ****************************************************************************************************************************************
changed: [clickhouse-01]

TASK [Create database] ***************************************************************************************************************************************************
changed: [clickhouse-01]

PLAY [Install vector] ****************************************************************************************************************************************************

TASK [Gathering Facts] ***************************************************************************************************************************************************
ok: [clickhouse-01]

TASK [creating files directory] ******************************************************************************************************************************************
--- before
+++ after
@@ -1,4 +1,4 @@
 {
     "path": "./files",
-    "state": "absent"
+    "state": "directory"
 }

changed: [clickhouse-01]

TASK [downloading vector] ************************************************************************************************************************************************
changed: [clickhouse-01]

TASK [unarchiving vector] ************************************************************************************************************************************************
changed: [clickhouse-01]

PLAY RECAP ***************************************************************************************************************************************************************
clickhouse-01              : ok=14   changed=10   unreachable=0    failed=0    skipped=0    rescued=0    ignored=0```