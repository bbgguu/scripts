#!/bin/bash
#
# Send a login notification to your Telegram bot when any user logins to the host.
# Put the script file in the /etc/profile.d directory to make it run.

# Telegram Bot API token
TOKEN=""

# Telegram Bot API method
METHOD="sendMessage"

# Telegram Bot API link
URL="https://api.telegram.org/bot${TOKEN}/${METHOD}"

# Some parameters of sendMessage method

# Telegram account ID
CHAT_ID=""

# Message format
PARSE_MODE="Markdown"

# Message content
login="$(last -F | head -n 1)"
user="$(echo ${login} | awk '{ print $1 }')"
host="$(hostname)"
date_old_tz="$(echo ${login} | awk '{ print $5, $6, $7, $8 }') $(date +"%Z")"
date_new_tz="$(TZ="Asia/Shanghai" date -d "${date_old_tz}" +"%Y-%m-%d %H:%M:%S")"
addr="$(echo ${login} | awk '{ print $3 }')"

newline="%0A"
TEXT="*New Login*${newline}User: ${user}${newline}Host: ${host}${newline}Date: ${date_new_tz}${newline}Addr: ${addr}"

# Send a message to your Telegram bot
curl -so /dev/null -X POST -d "chat_id=${CHAT_ID}" -d "parse_mode=${PARSE_MODE}" -d "text=${TEXT}" "${URL}"
