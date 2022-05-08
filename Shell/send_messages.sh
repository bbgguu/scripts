#!/bin/bash
#
# Send some messages to your Telegram bot.

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
newline="%0A"
TEXT="*Hello, World!*"

# Send a message to your Telegram bot
curl -so /dev/null -X POST -d "chat_id=${CHAT_ID}" -d "parse_mode=${PARSE_MODE}" -d "text=${TEXT}" "$URL"
