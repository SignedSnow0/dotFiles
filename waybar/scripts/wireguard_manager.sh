#!/usr/bin/env bash

# Function to prompt for sudo password via rofi
function askpass() {
    rofi -dmenu -password -no-fixed-num-lines -p "Sudo password: " 
}

# Function to grab all available .conf files (without the extension)
function get_configs() {
    # We use sudo here in case /etc/wireguard permissions are restricted
    SUDO_ASKPASS=$0 sudo -A ls /etc/wireguard/ 2>/dev/null | grep '\.conf$' | sed 's/\.conf$//'
}

function toggle_wireguard() {
    # Check if any WireGuard interface is currently active
    IF_NAME=$(sudo -n wg show 2>/dev/null | grep -i "interface: " | awk '{print $2}')

    if [ -z "$IF_NAME" ]; then
        # 1. Get list of available configurations
        CONFIGS=$(get_configs)

        if [ -z "$CONFIGS" ]; then
            # If we still can't read them, we might need password elevation first
            # Prompting with askpass to ensure we can read the directory
            SUDO_ASKPASS=$0 sudo -A true 2>/dev/null
            CONFIGS=$(get_configs)
        fi

        # 2. If no configs exist at all, exit
        if [ -z "$CONFIGS" ]; then
            echo "{\"text\": \"No Configs\", \"alt\": \"disconnected\", \"tooltip\": \"No configs found in /etc/wireguard\", \"class\": \"disconnected\"}"
            exit 1
        fi

        # 3. Present the configurations in a rofi menu
        SELECTED_CONFIG=$(echo "$CONFIGS" | rofi -dmenu -p "Select WireGuard Config: ")

        # 4. If the user cancelled or selected nothing, exit gracefully
        if [ -z "$SELECTED_CONFIG" ]; then
            echo "{\"text\": \"\", \"alt\": \"disconnected\", \"tooltip\": \"Connection cancelled\", \"class\": \"disconnected\"}"
            exit 0
        fi

        # 5. Bring up the selected configuration
        SUDO_ASKPASS=$0 sudo -A wg-quick up "$SELECTED_CONFIG" #>/dev/null 2>/dev/null
        echo "{\"text\": \"$SELECTED_CONFIG\", \"alt\": \"connected\", \"tooltip\": \"Connected to $SELECTED_CONFIG\", \"class\": \"connected\"}"
    else
        # If already connected, disconnect the active interface
        SUDO_ASKPASS=$0 sudo -A wg-quick down "$IF_NAME" >/dev/null 2>/dev/null
        SUDO_ASKPASS=$0 sudo -A resolvconf -u >/dev/null 2>/dev/null
        echo "{\"text\": \"\", \"alt\": \"disconnected\", \"tooltip\": \"Disconnected\", \"class\": \"disconnected\"}"
    fi
}

function status_wireguard() {
    IF_NAME=$(sudo -n wg show 2>/dev/null | grep -i "interface: " | awk '{print $2}')

    if [ -z "$IF_NAME" ]; then 
        echo "{\"text\": \"\", \"alt\": \"disconnected\", \"tooltip\": \"Disconnected\", \"class\": \"disconnected\"}"
    else
        echo "{\"text\": \"$IF_NAME\", \"alt\": \"connected\", \"tooltip\": \"Connected to $IF_NAME\", \"class\": \"connected\"}"
    fi
}

case $1 in
  -s | --status)
    status_wireguard
    ;;
  -t | --toggle)
    toggle_wireguard
    ;;
  *)
    askpass
    ;;
esac
