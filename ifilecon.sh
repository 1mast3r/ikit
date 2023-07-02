#!/bin/bash

# Check for the presence of an iOS device
if ! idevice_id -l >/dev/null 2>&1; then
    echo "Error 1: No connected device."
    exit 1
fi

# Function for managing contacts
function manage_contacts() {
    echo "Selected function: Manage Contacts."

    # Get the list of contacts
    echo "Contact List:"
    idevicecontact -l

    # Add a new contact
    echo "Adding a new contact..."
    echo -n "Enter the contact name: "
    read -r contact_name
    echo -n "Enter the phone number: "
    read -r phone_number
    idevicecontact -a "$contact_name" "$phone_number"

    # Update a contact
    echo "Updating a contact..."
    echo -n "Enter the contact name to update: "
    read -r contact_name
    echo -n "Enter the new phone number: "
    read -r phone_number
    idevicecontact -u "$contact_name" "$phone_number"

    # Remove a contact
    echo "Removing a contact..."
    echo -n "Enter the contact name to remove: "
    read -r contact_name
    idevicecontact -r "$contact_name"
}

# Function for managing notes
function manage_notes() {
    echo "Selected function: Manage Notes."

    # Get the list of notes
    echo "Note List:"
    idevicenote -l

    # Add a new note
    echo "Adding a new note..."
    echo -n "Enter the note title: "
    read -r note_title
    echo -n "Enter the note text: "
    read -r note_text
    idevicenote -a "$note_title" "$note_text"

    # Update a note
    echo "Updating a note..."
    echo -n "Enter the note title to update: "
    read -r note_title
    echo -n "Enter the new note text: "
    read -r note_text
    idevicenote -u "$note_title" "$note_text"

    # Remove a note
    echo "Removing a note..."
    echo -n "Enter the note title to remove: "
    read -r note_title
    idevicenote -r "$note_title"
}

# Main menu
echo "Select a function:"
echo "1. Manage Contacts"
echo "2. Manage Notes"
echo "3. Exit"

read -r choice

case $choice in
    1)
        manage_contacts
        ;;
    2)
        manage_notes
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