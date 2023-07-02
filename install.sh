#!/bin/bash
cd installer
# Главное меню
while true; do
    echo "Select an option:"
    echo "1. Ubuntu"
    echo "2. Alpine"
    echo "3. Exit"

    read -r choice

    case $choice in
        1)
            bash ubuntu.sh
            # Ваша команда A
            ;;
        2)
            bash alpine.sh
            # Ваша команда B
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
    bash ikit.sh
done