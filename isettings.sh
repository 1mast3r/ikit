#!/bin/bash

# Функция для вывода текущих настроек
function show_settings() {
    echo "Current Device Settings:"
    idevicesettings2 -u "$device_udid" -l
}

# Функция для изменения настроек
function change_setting() {
    echo "Select a setting to change:"
    echo "1. Wi-Fi"
    echo "2. Bluetooth"
    echo "3. Airplane Mode"
    echo "4. Back"

    read -r choice

    case $choice in
        1)
            toggle_setting "com.apple.wifi" "Wi-Fi"
            ;;
        2)
            toggle_setting "com.apple.bluetooth" "Bluetooth"
            ;;
        3)
            toggle_setting "com.apple.airplane" "Airplane Mode"
            ;;
        4)
            return
            ;;
        *)
            echo "Invalid choice."
            ;;
    esac
}

# Функция для изменения состояния настройки
function toggle_setting() {
    setting_id="$1"
    setting_name="$2"

    current_state=$(idevicesettings2 -u "$device_udid" -q "$setting_id")

    if [[ "$current_state" == "true" ]]; then
        idevicesettings2 -u "$device_udid" "$setting_id"="false"
        echo "$setting_name is now disabled."
    else
        idevicesettings2 -u "$device_udid" "$setting_id"="true"
        echo "$setting_name is now enabled."
    fi
}

# Проверка наличия подключенного iOS-устройства
if ! idevice_id -l >/dev/null 2>&1; then
    echo "Error 1: No connected device."
    exit 1
fi

# Получение UDID подключенного устройства
device_udid=$(idevice_id -l | head -n1)

# Главное меню
while true; do
    echo "Select an option:"
    echo "1. Show Device Settings"
    echo "2. Change Device Settings"
    echo "3. Exit"

    read -r choice

    case $choice in
        1)
            show_settings
            ;;
        2)
            change_setting
            ;;
        3)
            echo "Exiting..."
            exit 0
            ;;
        *)
            echo "Invalid choice."
            ;;
    esac

    echo
done