#!/bin/bash

# Display menu options
echo "Please choose an action:"
echo "1. Restart Nginx"
echo "2. Reload Nginx"
read -p "Enter your choice [1 or 2]: " choice

# Restart or reload Nginx based on user choice
case $choice in
    1)
        systemctl daemon-reload
        nginx -T
        systemctl restart nginx
        ;;
    2)
        nginx -T
        nginx -s reload
        ;;
    *)
        echo "Invalid choice. Please enter 1 or 2."
        exit 1
        ;;
esac

# Display Nginx status
echo -e "\n\n"
systemctl status nginx
