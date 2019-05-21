#!/bin/bash

set -e

if [ -f /etc/sudoers.d/app ]; then
  sudo chown -R app:app /usr/src/app/deps /usr/src/app/_build
  # sudo rm /etc/sudoers.d/app
else
  echo "[Entrypoint]: Sudo rights already removed."
fi

exec "$@"
