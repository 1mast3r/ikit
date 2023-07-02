#!/bin/bash
cd files
# Главное меню
while true; do
    echo "Select an option:"
    echo "1. Restore iOS"
    echo "2. Manage Data"
    echo "3. Share Files"
    echo "4. Install Apps"
    echo "5. Backup Data"
    echo "6. Get Device Info"
    echo "7. Manage Settings"
    echo "8. Exit"
    read -r choice

    case $choice in
        1)
            bash irestore.sh
            ;;
        2)
            bash ifilecon.sh
            ;;
        3)
            bash ishare.sh
            ;;
        4)
            bash iappinstall.sh
            ;;
        5)
            bash ibackup.sh
            ;;
        6)
            bash igetinfo.sh
            ;;
        7)
            bash isettings.sh
            ;;
        8)
            echo "Exiting..."
            exit 0
            cd ..
            ;;
        *)
            echo "Invalid choice."
            ;;
    esac

    echo
done
cd ..