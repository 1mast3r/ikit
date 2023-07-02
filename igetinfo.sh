#!/bin/bash

# Проверка наличия устройства iOS
if ! idevice_id -l >/dev/null 2>&1; then
    echo "Error 1: No connected devices."
    exit 1
fi

# Получение информации об устройстве
echo "Device information:"
ideviceinfo