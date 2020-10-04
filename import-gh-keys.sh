#!/bin/sh

AUTH_FILE="${HOME}/.ssh/authorized_keys"
read -p "Please type your github username: " USERNAME

mkdir -p "$(dirname "${AUTH_FILE}")"
chmod 700 "$(dirname "${AUTH_FILE}")"
touch "${AUTH_FILE}"
chmod 600 "${AUTH_FILE}"

if [ -x "$(which wget)" ]; then
  wget -O - "https://github.com/${USERNAME}.keys" >> "${AUTH_FILE}"
elif [ -x "$(which curl)" ]; then
  curl -sSL "https://github.com/${USERNAME}.keys" >> "${AUTH_FILE}"
else
  echo "Neither curl nor wget are present and on the path. Please install one of them" >&2
  exit 1
fi
