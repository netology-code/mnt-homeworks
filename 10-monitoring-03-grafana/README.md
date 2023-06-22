# Домашнее задание к занятию "14.Средство визуализации Grafana"

## Обязательные задания

### Задание 1
Сделал иначе, на работе поднял графану с такими же метриками как у заббикса
Решение домашнего задания - скриншот веб-интерфейса grafana со списком подключенных Datasource.

[Графана](help/Grafana.png)

[Заббикс](help/Zabbix.png)
## Задание 2 and
## Задание 3
В графане было добавлено еще две панельки с метриками это Asterisk Aktive Peers и входящий исходящий траффик от роутера Mikrotic 

Для решения ДЗ - приведите скриншот вашей итоговой Dashboard.
[Asterisk Aktive Peers](help/asrerisk.png)
[Mikrotic](help/mikrotik.png)
Так же настроена система оповещения в телеграмм-бот:
[Notification](help/notification.png)
[Message](help/messange.png)

Готовый скрипт для **telegram**(help/telegram.sh)

```#!/bin/bash

token='<<id_telegram_bot>>'
chat="$1"
subj="$2"
message="$3"

/usr/bin/torsocks /usr/bin/curl -s --header 'Content-Type: application/json' --request 'POST' --data "{\"chat_id\":\"${chat}\",\"text\":\"${subj}\n${message}\"}" "https://api.telegram.org/bot${token}/sendMessage"
```
Хде **<<id_telegram_bot>>** - уникальный id бота
## Задание 4
Сохраните ваш Dashboard.

Для этого перейдите в настройки Dashboard, выберите в боковом меню "JSON MODEL".

Далее скопируйте отображаемое json-содержимое в отдельный файл и сохраните его.

В решении задания - приведите листинг этого файла.

---
Листинг и файл:
[Json](https://github.com/NamorNinayzuk/mnt-homeworks/edit/MNT-video/10-monitoring-03-grafana/gr.json)

---

### Как оформить ДЗ?

Выполненное домашнее задание пришлите ссылкой на .md-файл в вашем репозитории.

---
