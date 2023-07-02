#!/bin/bash

# Проверка наличия устройства iOS
if ! idevice_id -l >/dev/null 2>&1; then
    echo "Error 1: No connected device."
    exit 1
fi

# Проверка наличия файла для передачи
if [ $# -eq 0 ]; then
    echo "Enter file path:"
    exit 1
fi

file_path="$1"

# Проверка существования файла
if [ ! -f "$file_path" ]; then
    echo "Error 2: File not found."
    exit 1
fi

# Извлечение имени файла из пути
file_name=$(basename "$file_path")

# Передача файла на устройство
echo "Loading…"
echo "Installing…"
if ! ideviceinstaller -i "$file_path"; then
    echo "Error 3: Unknown error."
    exit 1
fi

echo "Done."