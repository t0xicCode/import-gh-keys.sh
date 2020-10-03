#!/bin/sh

AUTH_FILE="${HOME}/.ssh/authorized_keys"
read -p "Please type your github username: " USERNAME

mkdir -p "$(dirname "${AUTH_FILE}")"
chmod 700 "$(dirname "${AUTH_FILE}")"
touch "${AUTH_FILE}"
chmod 600 "${AUTH_FILE}"

wget -O - "https://github.com/${USERNAME}.keys" >> "${AUTH_FILE}"
