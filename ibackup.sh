#!/bin/bash

# Функция для создания резервной копии
function create_backup() {
    echo "Creating backup..."

    # Генерация уникального имени для резервной копии
    backup_name="backup_$(date +'%Y%m%d%H%M%S').tar"

    # Создание резервной копии
    idevicebackup2 backup "$backup_name"

    echo "Backup created: $backup_name"
}

# Функция для восстановления из резервной копии
function restore_backup() {
    echo "Restoring from backup..."

    # Проверка наличия резервных копий
    if [ "$(ls -A ./*.tar 2>/dev/null)" ]; then
        # Вывод списка доступных резервных копий
        echo "Available backups:"
        ls -l ./*.tar

        # Запрос имени резервной копии
        echo -n "Enter the backup name to restore: "
        read -r backup_name

        # Проверка существования указанной резервной копии
        if [ -e "$backup_name" ]; then
            # Восстановление из резервной копии
            idevicebackup2 restore "$backup_name"

            echo "Restoration completed."
        else
            echo "Error 5: Backup not found: $backup_name"
        fi
    else
        echo "No backups found."
    fi
}

# Основное меню
echo "Select an option:"
echo "1. Create Backup"
echo "2. Restore from Backup"
echo "3. Exit"

read -r choice

case $choice in
    1)
        create_backup
        ;;
    2)
        restore_backup
        ;;
    3)
        echo "Exiting..."
        exit 0
        ;;
    *)
        echo "Invalid choice."
        exit 1
        ;;
esac