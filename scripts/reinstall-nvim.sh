#!/bin/bash

# Neovim Plugin and Tool Reinstallation Script
# This script helps force reinstallation of plugins and PHP tools

set -e

NVIM_DATA_DIR="${XDG_DATA_HOME:-$HOME/.local/share}/nvim"
NVIM_CACHE_DIR="${XDG_CACHE_HOME:-$HOME/.cache}/nvim"

echo "Neovim Reinstallation Script"
echo "=============================="
echo ""
echo "This script will help you reinstall Neovim plugins and PHP tools."
echo ""

# Function to reinstall plugins
reinstall_plugins() {
    echo "Removing lazy.nvim cache and plugins..."
    rm -rf "$NVIM_DATA_DIR/lazy"
    rm -rf "$NVIM_DATA_DIR/plugin"
    echo "? Lazy.nvim cache cleaned"
    echo ""
    echo "Next steps:"
    echo "1. Open Neovim"
    echo "2. Plugins will automatically reinstall"
    echo "3. Or run :Lazy install to manually trigger installation"
}

# Function to reinstall Mason tools
reinstall_mason() {
    echo "Removing Mason tools..."
    rm -rf "$NVIM_DATA_DIR/mason"
    echo "? Mason tools removed"
    echo ""
    echo "Next steps:"
    echo "1. Open Neovim"
    echo "2. Run :MasonInstallAll to install all tools"
    echo "3. Or run :Mason to open the UI and install manually"
}

# Function to clean everything
clean_all() {
    echo "Removing all Neovim data..."
    rm -rf "$NVIM_DATA_DIR/lazy"
    rm -rf "$NVIM_DATA_DIR/plugin"
    rm -rf "$NVIM_DATA_DIR/mason"
    rm -rf "$NVIM_CACHE_DIR"
    echo "? All Neovim data cleaned"
    echo ""
    echo "Next steps:"
    echo "1. Open Neovim"
    echo "2. Everything will automatically reinstall"
}

# Menu
echo "What would you like to reinstall?"
echo ""
echo "1) Plugins only (lazy.nvim)"
echo "2) PHP Tools only (Mason)"
echo "3) Everything (plugins + tools + cache)"
echo "4) Exit"
echo ""
read -p "Choose an option [1-4]: " choice

case $choice in
    1)
        reinstall_plugins
        ;;
    2)
        reinstall_mason
        ;;
    3)
        clean_all
        ;;
    4)
        echo "Exiting..."
        exit 0
        ;;
    *)
        echo "Invalid option. Exiting..."
        exit 1
        ;;
esac

echo ""
echo "Done! ??"
