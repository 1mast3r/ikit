#!/bin/bash

# Проверка наличия устройства iOS
if ! idevice_id -l >/dev/null 2>&1; then
    echo "Error 1: No connected devices."
    exit 1
fi

# Проверка наличия файла IPA для установки
if [ $# -eq 0 ]; then
    echo "Enter a iPA file path."
    exit 1
fi

ipa_path="$1"

# Проверка существования файла IPA
if [ ! -f "$ipa_path" ]; then
    echo "Error 2: File not found."
    exit 1
fi

# Установка приложения на устройство
echo "Installing…"
if ! ideviceinstaller -i "$ipa_path"; then
    echo "Error 3: Unknown error."
    exit 1
fi

echo "Done."