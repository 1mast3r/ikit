#!/bin/bash

# Проверка наличия доступных прошивок для восстановления
echo "Getting a list of available firmware…"
firmwares=$(idevicerestore --list)

if [ -z "$firmwares" ]; then
    echo "Error 2: File not found"
    exit 1
fi

echo "Firmware list:"
echo "$firmwares"

# Запрос пользователю выбрать прошивку
read -p "Enter the firmware number: " firmware_number

# Проверка введенного номера прошивки
if [[ ! "$firmware_number" =~ ^[0-9]+$ ]]; then
    echo "Error 4: Number entered incorrectly"
    exit 1
fi

# Получение выбранной прошивки по номеру
selected_firmware=$(echo "$firmwares" | sed -n "${firmware_number}p")

if [ -z "$selected_firmware" ]; then
    echo "Error 4: Number entered incorrectly."
    exit 1
fi

echo "Firmware: $selected_firmware"

# Восстановление iPhone с выбранной прошивкой
echo "Restoring…"
idevicerestore --restore $selected_firmware

# Проверка кода завершения операции восстановления
if [ $? -eq 0 ]; then
    echo "Done."
else
    echo "Error 3: Unknown error."
    echo "Done."
fi