# Домашнее задание к занятию "14.Средство визуализации Grafana"

## Задание повышенной сложности

**В части задания 1** не используйте директорию [help](./help) для сборки проекта, самостоятельно разверните grafana, где в 
роли источника данных будет выступать prometheus, а сборщиком данных node-exporter:
- grafana
- prometheus-server
- prometheus node-exporter

За дополнительными материалами, вы можете обратиться в официальную документацию grafana и prometheus.

В решении к домашнему заданию приведите также все конфигурации/скрипты/манифесты, которые вы 
использовали в процессе решения задания.

**В части задания 3** вы должны самостоятельно завести удобный для вас канал нотификации, например Telegram или Email
и отправить туда тестовые события.

В решении приведите скриншоты тестовых событий из каналов нотификаций.

## Обязательные задания

### Задание 1
Используя директорию [help](./help) внутри данного домашнего задания - запустите связку prometheus-grafana.

Зайдите в веб-интерфейс графана, используя авторизационные данные, указанные в манифесте docker-compose.

Подключите поднятый вами prometheus как источник данных.

Решение домашнего задания - скриншот веб-интерфейса grafana со списком подключенных Datasource.
![Графана](https://imgur.com/WSiEe6E)
![Заббикс](https://imgur.com/WSiEe6E)
## Задание 2
~~Изучите самостоятельно ресурсы:
- [PromQL tutorial for beginners and humans](https://valyala.medium.com/promql-tutorial-for-beginners-9ab455142085)
- [Understanding Machine CPU usage](https://www.robustperception.io/understanding-machine-cpu-usage)
- [Introduction to PromQL, the Prometheus query language](https://grafana.com/blog/2020/02/04/introduction-to-promql-the-prometheus-query-language/)

Создайте Dashboard и в ней создайте следующие Panels:
- Утилизация CPU для nodeexporter (в процентах, 100-idle)
- CPULA 1/5/15
- Количество свободной оперативной памяти
- Количество места на файловой системе

Для решения данного ДЗ приведите promql запросы для выдачи этих метрик, а также скриншот получившейся Dashboard.~~

## Задание 3
Создайте для каждой Dashboard подходящее правило alert (можно обратиться к первой лекции в блоке "Мониторинг").

Для решения ДЗ - приведите скриншот вашей итоговой Dashboard.
![Графана](https://imgur.com/UciiU10)

## Задание 4
Сохраните ваш Dashboard.

Для этого перейдите в настройки Dashboard, выберите в боковом меню "JSON MODEL".

Далее скопируйте отображаемое json-содержимое в отдельный файл и сохраните его.

В решении задания - приведите листинг этого файла.

---

---
{
  "annotations": {
    "list": [
      {
        "builtIn": 1,
        "datasource": {
          "type": "grafana",
          "uid": "-- Grafana --"
        },
        "enable": true,
        "hide": true,
        "iconColor": "rgba(0, 211, 255, 1)",
        "name": "Annotations & Alerts",
        "target": {
          "limit": 100,
          "matchAny": false,
          "tags": [],
          "type": "dashboard"
        },
        "type": "dashboard"
      }
    ]
  },
  "editable": true,
  "fiscalYearStartMonth": 0,
  "graphTooltip": 0,
  "id": 5,
  "links": [],
  "liveNow": false,
  "panels": [
    {
      "ackEventColor": "rgb(56, 219, 156)",
      "ackField": true,
      "ageField": true,
      "customLastChangeFormat": false,
      "datasource": {
        "type": "alexanderzobnin-zabbix-datasource",
        "uid": "NuRJTfT4z"
      },
      "description": "",
      "descriptionAtNewLine": false,
      "descriptionField": true,
      "fontSize": "100%",
      "gridPos": {
        "h": 8,
        "w": 20,
        "x": 0,
        "y": 0
      },
      "highlightBackground": false,
      "highlightNewEvents": false,
      "highlightNewerThan": "1h",
      "hostField": true,
      "hostGroups": true,
      "hostProxy": false,
      "hostTechNameField": false,
      "id": 2,
      "lastChangeFormat": "",
      "layout": "table",
      "markAckEvents": false,
      "okEventColor": "rgb(56, 189, 113)",
      "pageSize": 10,
      "pluginVersion": "9.3.2",
      "problemTimeline": true,
      "resizedColumns": [
        {
          "id": "host",
          "value": 96
        },
        {
          "id": "hostTechName",
          "value": 171.5
        },
        {
          "id": "groups",
          "value": 145
        },
        {
          "id": "age",
          "value": 85
        },
        {
          "id": "lastchange",
          "value": 161
        }
      ],
      "schemaVersion": 8,
      "severityField": true,
      "showTags": false,
      "sortProblems": "lastchange",
      "statusField": true,
      "statusIcon": false,
      "targets": [
        {
          "application": {
            "filter": ""
          },
          "datasource": {
            "type": "alexanderzobnin-zabbix-datasource",
            "uid": "NuRJTfT4z"
          },
          "functions": [],
          "group": {
            "filter": ""
          },
          "host": {
            "filter": "/.*/"
          },
          "item": {
            "filter": ""
          },
          "itemTag": {
            "filter": ""
          },
          "options": {
            "acknowledged": 2,
            "disableDataAlignment": false,
            "hostProxy": false,
            "hostsInMaintenance": false,
            "limit": 1001,
            "minSeverity": 0,
            "showDisabledItems": false,
            "skipEmptyValues": false,
            "sortProblems": "default",
            "useZabbixValueMapping": false
          },
          "proxy": {
            "filter": ""
          },
          "queryType": "5",
          "refId": "A",
          "resultFormat": "time_series",
          "showProblems": "problems",
          "slaInterval": "none",
          "slaProperty": {
            "name": "SLA",
            "property": "sla"
          },
          "table": {
            "skipEmptyValues": false
          },
          "tags": {
            "filter": ""
          },
          "trigger": {
            "filter": ""
          },
          "triggers": {
            "acknowledged": 2,
            "count": true,
            "minSeverity": 3
          }
        }
      ],
      "title": "Problems and Warnings",
      "triggerSeverity": [
        {
          "$$hashKey": "object:90",
          "color": "rgb(108, 108, 108)",
          "priority": 0,
          "severity": "Not classified",
          "show": true
        },
        {
          "$$hashKey": "object:91",
          "color": "rgb(120, 158, 183)",
          "priority": 1,
          "severity": "Information",
          "show": true
        },
        {
          "$$hashKey": "object:92",
          "color": "rgb(175, 180, 36)",
          "priority": 2,
          "severity": "Warning",
          "show": true
        },
        {
          "$$hashKey": "object:93",
          "color": "rgb(255, 137, 30)",
          "priority": 3,
          "severity": "Average",
          "show": true
        },
        {
          "$$hashKey": "object:94",
          "color": "rgb(255, 101, 72)",
          "priority": 4,
          "severity": "High",
          "show": true
        },
        {
          "$$hashKey": "object:95",
          "color": "rgb(215, 0, 0)",
          "priority": 5,
          "severity": "Disaster",
          "show": true
        }
      ],
      "type": "alexanderzobnin-zabbix-triggers-panel"
    },
    {
      "datasource": {
        "type": "alexanderzobnin-zabbix-datasource",
        "uid": "NuRJTfT4z"
      },
      "fieldConfig": {
        "defaults": {
          "color": {
            "mode": "palette-classic"
          },
          "custom": {
            "axisCenteredZero": false,
            "axisColorMode": "text",
            "axisLabel": "",
            "axisPlacement": "auto",
            "barAlignment": 0,
            "drawStyle": "line",
            "fillOpacity": 0,
            "gradientMode": "none",
            "hideFrom": {
              "legend": false,
              "tooltip": false,
              "viz": false
            },
            "lineInterpolation": "linear",
            "lineWidth": 1,
            "pointSize": 5,
            "scaleDistribution": {
              "type": "linear"
            },
            "showPoints": "auto",
            "spanNulls": false,
            "stacking": {
              "group": "A",
              "mode": "none"
            },
            "thresholdsStyle": {
              "mode": "off"
            }
          },
          "mappings": [],
          "min": 0,
          "thresholds": {
            "mode": "absolute",
            "steps": [
              {
                "color": "green"
              },
              {
                "color": "red",
                "value": 80
              }
            ]
          },
          "unit": "none"
        },
        "overrides": []
      },
      "gridPos": {
        "h": 8,
        "w": 4,
        "x": 20,
        "y": 0
      },
      "id": 6,
      "options": {
        "legend": {
          "calcs": [
            "lastNotNull"
          ],
          "displayMode": "list",
          "placement": "bottom",
          "showLegend": true
        },
        "tooltip": {
          "mode": "single",
          "sort": "none"
        }
      },
      "targets": [
        {
          "application": {
            "filter": "Asterisk"
          },
          "datasource": {
            "type": "alexanderzobnin-zabbix-datasource",
            "uid": "NuRJTfT4z"
          },
          "functions": [],
          "group": {
            "filter": "Linux servers"
          },
          "host": {
            "filter": "Asterisk"
          },
          "item": {
            "filter": "Active peers"
          },
          "itemTag": {
            "filter": ""
          },
          "options": {
            "disableDataAlignment": false,
            "showDisabledItems": false,
            "skipEmptyValues": false,
            "useZabbixValueMapping": false
          },
          "proxy": {
            "filter": ""
          },
          "queryType": "0",
          "refId": "A",
          "resultFormat": "time_series",
          "table": {
            "skipEmptyValues": false
          },
          "tags": {
            "filter": ""
          },
          "trigger": {
            "filter": ""
          },
          "triggers": {
            "acknowledged": 2,
            "count": true,
            "minSeverity": 3
          }
        }
      ],
      "title": "Asterisk Active Peers",
      "type": "timeseries"
    },
    {
      "datasource": {
        "type": "alexanderzobnin-zabbix-datasource",
        "uid": "NuRJTfT4z"
      },
      "fieldConfig": {
        "defaults": {
          "color": {
            "mode": "palette-classic"
          },
          "custom": {
            "axisCenteredZero": false,
            "axisColorMode": "text",
            "axisLabel": "",
            "axisPlacement": "auto",
            "barAlignment": 0,
            "drawStyle": "line",
            "fillOpacity": 0,
            "gradientMode": "none",
            "hideFrom": {
              "legend": false,
              "tooltip": false,
              "viz": false
            },
            "lineInterpolation": "linear",
            "lineStyle": {
              "fill": "solid"
            },
            "lineWidth": 1,
            "pointSize": 5,
            "scaleDistribution": {
              "type": "linear"
            },
            "showPoints": "auto",
            "spanNulls": false,
            "stacking": {
              "group": "A",
              "mode": "none"
            },
            "thresholdsStyle": {
              "mode": "off"
            }
          },
          "mappings": [],
          "thresholds": {
            "mode": "percentage",
            "steps": [
              {
                "color": "green"
              },
              {
                "color": "red",
                "value": 80
              }
            ]
          }
        },
        "overrides": [
          {
            "matcher": {
              "id": "byName",
              "options": "mikrotik: Ether 1 (TTK) Out"
            },
            "properties": [
              {
                "id": "color",
                "value": {
                  "fixedColor": "orange",
                  "mode": "palette-classic"
                }
              }
            ]
          },
          {
            "matcher": {
              "id": "byName",
              "options": "mikrotik: Ether 1(TTK) In"
            },
            "properties": [
              {
                "id": "color",
                "value": {
                  "fixedColor": "green",
                  "mode": "palette-classic"
                }
              }
            ]
          },
          {
            "matcher": {
              "id": "byName",
              "options": "mikrotik: Ether 0 (SL) In"
            },
            "properties": [
              {
                "id": "color",
                "value": {
                  "fixedColor": "orange",
                  "mode": "fixed"
                }
              }
            ]
          },
          {
            "matcher": {
              "id": "byName",
              "options": "mikrotik: Ether 0 (SL) Out"
            },
            "properties": [
              {
                "id": "color",
                "value": {
                  "fixedColor": "blue",
                  "mode": "fixed"
                }
              }
            ]
          }
        ]
      },
      "gridPos": {
        "h": 8,
        "w": 11,
        "x": 0,
        "y": 8
      },
      "id": 4,
      "options": {
        "legend": {
          "calcs": [],
          "displayMode": "list",
          "placement": "bottom",
          "showLegend": true
        },
        "timezone": [
          "Europe/Samara"
        ],
        "tooltip": {
          "mode": "single",
          "sort": "none"
        }
      },
      "targets": [
        {
          "application": {
            "filter": "Network"
          },
          "datasource": {
            "type": "alexanderzobnin-zabbix-datasource",
            "uid": "NuRJTfT4z"
          },
          "functions": [],
          "group": {
            "filter": "Routerboard"
          },
          "hide": false,
          "host": {
            "filter": "mikrotik"
          },
          "item": {
            "filter": "Ether 1(TTK) In"
          },
          "itemTag": {
            "filter": ""
          },
          "options": {
            "disableDataAlignment": false,
            "showDisabledItems": false,
            "skipEmptyValues": false,
            "useZabbixValueMapping": false
          },
          "proxy": {
            "filter": ""
          },
          "queryType": "0",
          "refId": "A",
          "resultFormat": "time_series",
          "table": {
            "skipEmptyValues": false
          },
          "tags": {
            "filter": ""
          },
          "trigger": {
            "filter": ""
          },
          "triggers": {
            "acknowledged": 2,
            "count": true,
            "minSeverity": 3
          }
        },
        {
          "application": {
            "filter": "Network"
          },
          "datasource": {
            "type": "alexanderzobnin-zabbix-datasource",
            "uid": "NuRJTfT4z"
          },
          "functions": [],
          "group": {
            "filter": "Routerboard"
          },
          "hide": false,
          "host": {
            "filter": "mikrotik"
          },
          "item": {
            "filter": "Ether 1 (TTK) Out"
          },
          "itemTag": {
            "filter": ""
          },
          "options": {
            "disableDataAlignment": false,
            "showDisabledItems": false,
            "skipEmptyValues": false,
            "useZabbixValueMapping": false
          },
          "proxy": {
            "filter": ""
          },
          "queryType": "0",
          "refId": "B",
          "resultFormat": "time_series",
          "table": {
            "skipEmptyValues": false
          },
          "tags": {
            "filter": ""
          },
          "trigger": {
            "filter": ""
          },
          "triggers": {
            "acknowledged": 2,
            "count": true,
            "minSeverity": 3
          }
        },
        {
          "application": {
            "filter": "Network"
          },
          "datasource": {
            "type": "alexanderzobnin-zabbix-datasource",
            "uid": "NuRJTfT4z"
          },
          "functions": [],
          "group": {
            "filter": "Routerboard"
          },
          "hide": false,
          "host": {
            "filter": "mikrotik"
          },
          "item": {
            "filter": "Ether 0 (SL) In"
          },
          "itemTag": {
            "filter": ""
          },
          "options": {
            "disableDataAlignment": false,
            "showDisabledItems": false,
            "skipEmptyValues": false,
            "useZabbixValueMapping": false
          },
          "proxy": {
            "filter": ""
          },
          "queryType": "0",
          "refId": "C",
          "resultFormat": "time_series",
          "table": {
            "skipEmptyValues": false
          },
          "tags": {
            "filter": ""
          },
          "trigger": {
            "filter": ""
          },
          "triggers": {
            "acknowledged": 2,
            "count": true,
            "minSeverity": 3
          }
        },
        {
          "application": {
            "filter": "Network"
          },
          "datasource": {
            "type": "alexanderzobnin-zabbix-datasource",
            "uid": "NuRJTfT4z"
          },
          "functions": [],
          "group": {
            "filter": "Routerboard"
          },
          "hide": false,
          "host": {
            "filter": "mikrotik"
          },
          "item": {
            "filter": "Ether 0 (SL) Out"
          },
          "itemTag": {
            "filter": ""
          },
          "options": {
            "disableDataAlignment": false,
            "showDisabledItems": false,
            "skipEmptyValues": false,
            "useZabbixValueMapping": false
          },
          "proxy": {
            "filter": ""
          },
          "queryType": "0",
          "refId": "D",
          "resultFormat": "time_series",
          "table": {
            "skipEmptyValues": false
          },
          "tags": {
            "filter": ""
          },
          "trigger": {
            "filter": ""
          },
          "triggers": {
            "acknowledged": 2,
            "count": true,
            "minSeverity": 3
          }
        }
      ],
      "title": "Mikrotik IN & OUT",
      "type": "timeseries"
    }
  ],
  "refresh": "5s",
  "schemaVersion": 37,
  "style": "dark",
  "tags": [],
  "templating": {
    "list": []
  },
  "time": {
    "from": "now-1h",
    "to": "now"
  },
  "timepicker": {},
  "timezone": "",
  "title": "Zabbix",
  "uid": "DHaUbfoVk",
  "version": 17,
  "weekStart": ""
}
---

### Как оформить ДЗ?

Выполненное домашнее задание пришлите ссылкой на .md-файл в вашем репозитории.

---
