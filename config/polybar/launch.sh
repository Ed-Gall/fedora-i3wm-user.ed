#!/usr/bin/env bash

# Encerrar instâncias anteriores
killall -q polybar

# Esperar o encerramento
while pgrep -u "$UID" -x polybar >/dev/null; do
    sleep 1
done

# Iniciar Polybar
polybar example &
