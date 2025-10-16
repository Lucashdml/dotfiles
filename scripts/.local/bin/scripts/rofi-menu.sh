#!/bin/bash
#
# pacman-menu.sh
# A Rofi menu to launch pacman helper scripts.
#
# This script assumes you have a terminal emulator like 'kitty', 'alacritty',
# 'gnome-terminal', etc., that can execute a command.
#

# --- Configuration ---
# Set your preferred terminal emulator here.
# Most terminals use the '-e' flag to execute a command.
TERMINAL="kitty"

# --- Rofi Menu ---
# Define the options that will be displayed in the Rofi menu.
# The '\n' creates a new line for each menu item.
options=" Install Packages(Pacman)\n Install Packages(Yay)\n Remove Packages\n󰐥 System"

# Display the Rofi menu and capture the user's choice.
# -dmenu: Run rofi in dmenu mode (dynamic menu).
# -p: Set a prompt text.
# -i: Make the search case-insensitive.
chosen=$(echo -e "$options" | rofi -dmenu -p "❯" -i)

# --- Action Logic ---
# Use a 'case' statement to run a command based on the user's choice.
case "$chosen" in
    " Install Packages(Pacman)")
        # Launch the install script in a new floating terminal window.
        # --class allows us to set a specific name for Hyprland to catch.
        $TERMINAL --class "rofi-launcher" -e pacman-install.sh
        ;;
    " Install Packages(Yay)")
        # Launch the install script in a new floating terminal window.
        # --class allows us to set a specific name for Hyprland to catch.
        $TERMINAL --class "rofi-launcher" -e aur-install.sh
        ;;
    " Remove Packages")
        # Launch the uninstall script with the same settings.
        $TERMINAL --class "rofi-launcher" -e pacman-uninstall.sh
        ;;
    "󰐥 System")
        # Launch the uninstall script with the same settings.
        wlogout &
        ;;
esac
