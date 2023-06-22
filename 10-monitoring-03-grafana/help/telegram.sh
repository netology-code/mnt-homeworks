#!/bin/bash

token='<<id_telegramm_bot>>'
chat="$1"
subj="$2"
message="$3"

/usr/bin/torsocks /usr/bin/curl -s --header 'Content-Type: application/json' --request 'POST' --data "{\"chat_id\":\"${chat}\",\"text\":\"${subj}\n${message}\"}" "https://api.telegram.org/bot${token}/sendMessage"
